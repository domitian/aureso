class Organisation < ActiveRecord::Base
    has_many :models
    validates :name,presence: true
    validates :pricing_policy,presence: true
end
