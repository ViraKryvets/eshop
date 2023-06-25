class Order < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  validates :first_name, :last_name, :address, :phone, presence: true

  def product_quantity(product)
    product_orders.find_by(product:).amount
  end

  def subtotal(product)
    product_orders.joins(:product)
                .where(product_orders: { product_id: product.id })
                .select('product_orders.amount * products.price AS subtotal')
                .first&.subtotal

  end

  def total_amount
    product_orders.joins(:product).sum('product_orders.amount * products.price')
  end
end
