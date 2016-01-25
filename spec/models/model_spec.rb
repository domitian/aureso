require 'rails_helper'

RSpec.describe Model, type: :model do
  
    context "Model Validations" do

        it "has a name" do
            expect(build(:model,name: nil)).to_not be_valid
        end


    end

end
