class CartController < ApplicationController

  def add
    product = Product.find(params[:product_id])
    cart_service.add_product(product.id)

    redirect_to root_path, notice: 'Product added to cart.'
  end

  def remove
    product_id = params[:product_id]
    cart_service.remove_product(product_id)

    redirect_to cart_path, notice: 'Product removed from cart.'
  end

  def update
    product_id = params[:product_id]
    quantity = params[:quantity]
    cart_service.update_product_quantity(product_id, quantity)

    redirect_to cart_path, notice: 'Cart updated.'
  end

  def show
    @cart_items = cart_service.cart_items
    @total_amount = cart_service.total_amount
  end

  private

  def cart_service
    @cart_service ||= CartService.new(session)
  end
end
