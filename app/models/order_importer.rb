class OrderImporter

  def import_orders(limit: 250, order: "created_at DESC", start_date: 1.week.ago, end_date: Time.now)
    request = ShopifyRequest.new
    orders = request.get_orders(limit, order, start_date, end_date)
    orders.each do |order|
      new_order = create_order(order)
      create_order_item(new_order, order)
    end
  end

  def create_order(order)
    Order.where(order_ref: order.id).first_or_initialize do |new_order|
      new_order.first_name = order.customer.default_address.first_name
      new_order.last_name  = order.customer.default_address.last_name
      new_order.order_ref  = order.id
      new_order.data       = order.attributes
      new_order.save!
    end
  end

  def create_order_item(new_order, order)
    order.line_items.each do |item|
      OrderItem.where(order_item_ref: item.id).first_or_initialize do |new_order_item|
        new_order_item.order_id = new_order.id
        new_order_item.title = item.title
        new_order_item.product_ref = item.product_id
        new_order_item.variant_ref = item.variant_id
        new_order_item.variant_title = item.variant_title
        new_order_item.variant_name  = item.title
        new_order_item.data          = item.attributes
        new_order_item.save!
      end
    end
  end

end
