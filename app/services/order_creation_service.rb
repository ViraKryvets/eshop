class OrderCreationService

  def initialize(order_params, cart, session)
    @order_params = order_params
    @cart = cart
    @session = session
  end

  def create_order
    order = Order.new(@order_params)

    @cart.each do |product_id, quantity|
      product = Product.find(product_id)
      order.product_orders.new(product: product, amount: quantity)
    end

    if order.save
      @session[:cart] = nil
    end
    order
  end
end
