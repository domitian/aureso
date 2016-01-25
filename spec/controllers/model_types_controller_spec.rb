require 'rails_helper'

RSpec.describe ModelTypesController, type: :controller do
    describe "GET models/:model_slug/model_types" do
        let(:organisation) { create(:organisation)}
        let(:model){create(:model,organisation_id: organisation.id)}
        let(:model_type){create(:model_tyep,model_id: model_id)}

        it "responds successfully with an HTTP 200 status code" do
            get :index, {model_slug: model.model_slug}
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "responds with error json if model is not present" do
            get :index, {model_slug: "dummy slug"}
            expect(response).to have_http_status(404)
        end
    end

end
