class Model < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, slug_column: 'model_slug', use: :slugged
    has_many :model_types
    belongs_to :organisation

    validates :name, presence: true
end
