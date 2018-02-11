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

  def get_products(limit: 250, order: "created_at DESC")
    ShopifyAPI::Product.find(:all, params: { limit: limit, order: order })
  end

  def get_product(id)
    ShopifyAPI::Product.find(id)
  end

  def get_orders(limit: 250, order: "created_at DESC")
    ShopifyAPI::Order.find(:all, params: { limit: limit, order: order })
  end

  def get_order(id)
    ShopifyAPI::Order.find(id)
  end

  def get_meta_field(id)
    ShopifyAPI::Metafield.find(id)
  end

  def create_metafield(namespace, key, value, value_type)
    ShopifyAPI::Metafield.new(key: key, namespace: namespace, value: value, value_type: value_type)
  end

  def add_metafield(resource, metafield)
    resource.add_metafield(metafield)
  end

end
