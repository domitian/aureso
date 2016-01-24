class Model < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many: model_types
end
