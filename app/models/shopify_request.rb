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
    ShopifyAPI::Product.find(:all)
  end

  def get_product(id)
    ShopifyAPI::Product.find(id)
  end

  def get_orders
    ShopifyAPI::Order.find(:all)
  end

  def get_order(id)
    ShopifyAPI::Order.find(id)
  end

end
