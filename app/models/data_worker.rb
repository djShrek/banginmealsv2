class DataWorker
  SHOP_NAME = 'bangingmeals'

  attr_reader :shop_url, :shop

  def initialize
    @shop_url = "https://#{ENV["SHOPIFY_API_KEY"]}:#{ENV["SHOPIFY_API_PASSWORD"]}@#{SHOP_NAME}.myshopify.com/admin"
    ShopifyAPI::Base.site = @shop_url
  end

  def shop
    ShopifyAPI::Shop.current
  end
end
