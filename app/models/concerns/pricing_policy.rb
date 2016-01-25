module PricingPolicy
    extend ActiveSupport::Concern
    require 'open-uri'
    require 'nokogiri'
    require 'rss'

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
                margin = get_margin_for_flexible
                price = (@base_price *margin)/100.to_i
            elsif @policy == "fixed"
                margin = get_margin_for_fixed
                price = @base_price + margin
            elsif @policy == "prestige"
                margin = get_margin_for_prestige
                price = @base_price + margin
            end
            price
        end

        private

        def get_margin_for_flexible
           str = get_text_only_from_html(get_html_code('http://reuters.com') )
           str.count('a')
        end

        def get_margin_for_fixed
            str = get_text_only_from_html(get_html_code('https://developer.github.com/v3/#http-redirects') )
            str.scan(/status/).count
        end

        def get_margin_for_prestige
            rss_code = RSS::Parser.parse('http://www.yourlocalguardian.co.uk/sport/rugby/rss/', false)
            margin = rss_code.items.inject(0) do |result,item|
                result += 1 if item.respond_to? "pubDate"
            end
        end

        def get_html_code url
            open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
        end

        def get_text_only_from_html html_str
            text = Nokogiri::HTML(html_str)
            text.css("style,script").remove
            text.at('body').inner_text.to_s
        end

    end

end
