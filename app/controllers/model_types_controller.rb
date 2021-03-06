class ModelTypesController < ApplicationController
    #before_action :authenticate_user!, only: [:index] unless Rails.env.test?
    before_action :set_model, only: [:index]


    def index
        begin
            model_types = @model.model_types.inject([]) do |result,model_type|
                result << {name: model_type.name,total_price: model_type.calculate_total_price}
            end
            model_hash = {
                name: @model.name,
                model_types: model_types
            }
            data_to_send = {
                models: [model_hash]
            }
        rescue SocketError
            data_to_send = { errors: "No Internet Connection or Wrong url"}
        end
        render json: data_to_send
    end
        



    private

    def set_model
        begin 
            @model = Model.friendly.find(params[:model_slug])
        rescue ActiveRecord::RecordNotFound
            render json: {errors: "No Record Found"}, status: 404
            return
        end
    end

    def model_type_params
        params.require(:model_type).permit(:model_id)
    end


end
