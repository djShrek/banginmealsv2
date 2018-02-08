class ShopifyRequest
  SHOP_NAME = 'bangingmeals'

  attr_reader :shop_url, :shop

  def initialize
    @shop_url = "https://#{ENV["SHOPIFY_API_KEY"]}:#{ENV["SHOPIFY_API_PASSWORD"]}@#{SHOP_NAME}.myshopify.com/admin"
    ShopifyAPI::Base.site = @shop_url
  end

  def get_shop_information
    ShopifyAPI::Shop.current
  end

  def get_products
  end

  def get_orders
  end
end
