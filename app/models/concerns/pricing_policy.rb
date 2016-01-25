module PricingPolicy
    extend ActiveSupport::Concern

    def calculate_total_price
        PriceCalculator.new(self.model.organisation.pricing_policy,self.base_price).get_price
    end

    class PriceCalculator

        def initialize policy,base_price
            @policy = policy
            @base_price = base_price
        end

        def get_price
            if @policy == "flexible"
                margin = rand*100.to_i
                price = @base_price *margin
            elsif @policy == "fixed"
                margin = 1
                price = @base_price + margin
            elsif @policy == "prestige"
                margin = 100
                price = @base_price + margin
            end
            price
        end
    end

end
