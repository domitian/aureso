class ModelType < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    belongs_to :model

    include PricingPolicy
end
