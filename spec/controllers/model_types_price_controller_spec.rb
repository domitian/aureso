require 'rails_helper'

RSpec.describe ModelTypesPriceController, type: :controller do
    describe "POST models/:model_slug/model_types_price/:model_type_slug" do
        let(:organisation) { create(:organisation)}
        let(:model){create(:model,organisation_id: organisation.id)}
        let(:model_type){create(:model_type,model_id: model.id)}

        it "responds successfully with an HTTP 200 status code" do
            post :show,{model_slug: model.friendly_id,model_type_slug: model_type.friendly_id}, {base_price: 10000}
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "responds with error json if model_type is not present" do
            post :show,{model_slug: model.friendly_id,model_type_slug: "dummy model type slug"}, {base_price: 10000}
            expect(response).to have_http_status(404)
        end
    end

end
