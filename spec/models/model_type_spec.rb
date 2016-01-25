require 'rails_helper'

RSpec.describe ModelType, type: :model do

    context "Model Type Validations" do

        it "has a name" do
            expect(build(:model_type,name: nil)).to_not be_valid
        end
    end

end
