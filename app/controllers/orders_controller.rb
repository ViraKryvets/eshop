class OrdersController < ApplicationController
  include Cartable

  def index
    @orders = collection
  end

  def show
    @order = resource
  end

  def new
    @order = Order.new
  end

  def edit
    @order = resource
  end

  def create
    @order = Order.new(order_params)

    subtotal = 0
    cart.each do |product_id, quantity|
      product = Product.find(product_id)
      price = product.price
      subtotal += price * quantity
      @order.product_orders.new(product: product, amount: quantity)
    end

    @total_amount = subtotal

    if @order.save
      session[:cart] = nil # Clear the cart
      redirect_to order_path(@order), notice: 'Order was successfully created.'
    else
      render 'cart/show'
    end
  end

  def update
    @order = resource

    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order = resource
    @order.destroy

    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

    def collection
      Order.all
    end

    def resource
      Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:first_name, :last_name, :address, :phone)
    end

end
