class OrdersController < ApplicationController

  def index
    @orders = collection
  end

  def show
    @order = resource
  end

  def new
    @order = Order.new
    @cart_items = cart_service.cart_items
    @total_amount = cart_service.total_amount
  end

  def edit
    @order = resource
  end

  def create
    @order = OrderCreationService.new(order_params, cart, session).create_order

    if @order.persisted?
      redirect_to order_path(@order), notice: "Order was successfully created."
    else
      render :new
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
      collection.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:first_name, :last_name, :address, :phone)
    end

    def cart
      session[:cart] ||= {}
    end

    def cart_service
      CartService.new(session)
    end
end
