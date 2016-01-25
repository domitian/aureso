require 'rails_helper'

RSpec.describe Organisation, type: :model do
    context "Organisation Validations" do

        it "has a name" do
            expect(build(:organisation,name: nil)).to_not be_valid
        end
        it "has a pricing policy" do
            expect(build(:organisation,pricing_policy: nil)).to_not be_valid
        end

    end
end
