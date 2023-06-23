class OrderCreationService

  def initialize(order_params, cart, session)
    @order_params = order_params
    @cart = cart
    @session = session
  end

  def create_order
    order = Order.new(@order_params)
    subtotal = 0

    @cart.each do |product_id, quantity|
      product = Product.find(product_id)
      # price = product.price
      # subtotal += price * quantity
      order.product_orders.new(product: product, amount: quantity)
    end

    # @total_amount = subtotal

    if order.save
      @session[:cart] = nil # Clear the cart
    end

    order
  end


end
