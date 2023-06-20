class CartController < ApplicationController
  include Cartable

  def add
    product = Product.find(params[:product_id])
    cart[product.id.to_s] ||= 0
    cart[product.id.to_s] += 1

    redirect_to root_path, notice: 'Product added to cart.'
  end

  def remove
    product_id = params[:product_id]
    cart.delete(product_id)

    redirect_to cart_path, notice: 'Product removed from cart.'
  end

  def update
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    cart[product_id] = quantity

    redirect_to cart_path, notice: 'Cart updated.'
  end

  def show
    @cart_items = []
    subtotal = 0

    cart.each do |product_id, quantity|
    product = Product.find(product_id)
    price = product.price
    subtotal += price * quantity
    @cart_items << { product: product, quantity: quantity, price: price }
    end

    @total_amount = subtotal

    @order = Order.new
  end

end
