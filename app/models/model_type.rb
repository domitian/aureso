class ModelType < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, slug_column: 'model_type_slug',use: :slugged
    belongs_to :model

    include PricingPolicy

    validates :name,presence: true

end
