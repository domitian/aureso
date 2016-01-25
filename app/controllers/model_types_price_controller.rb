class ModelTypesPriceController < ApplicationController
    before_action :authenticate_user!
    before_action :set_model_type,only: [:show]
    skip_before_filter :verify_authenticity_token, only: [:show]

    def show
        # Refactor this code by adding total_price as attr_accessible and use simple select query to fetch the data
        begin
            @model_type.base_price = params[:base_price]
            mt = {
                name: @model_type.name,
                base_price: @model_type.base_price,
                total_price: @model_type.calculate_total_price
            }
            data_to_send = {
                model_type: mt
            }
        rescue SocketError
            data_to_send = { errors: "No Internet Connection or Wrong url"}
        end
        render json: data_to_send
    end

    private

    def set_model_type
        begin
            @model_type = ModelType.friendly.find(params[:model_type_slug])
        rescue ActiveRecord::RecordNotFound
            render json: {errors: "No Record Found"}
            return
        end
    end
end
