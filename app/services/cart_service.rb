class CartService

    def initialize(session)
      @session = session
    end

    def add_product(product_id)
      cart[product_id.to_s] ||= 0
      cart[product_id.to_s] += 1
    end

    def remove_product(product_id)
      cart.delete(product_id.to_s)
    end

    def update_product_quantity(product_id, quantity)
      cart[product_id.to_s] = quantity.to_i
    end

    def cart_items
      @cart_items ||= calculate_cart_items
    end

    def total_amount
      @total_amount ||= cart_items.sum { |item| item[:price] * item[:quantity] }
    end

    private

    def cart
      @session[:cart] ||= {}
    end

    def calculate_cart_items
      cart.map do |product_id, quantity|
        product = Product.find(product_id)
        price = product.price
        subtotal = quantity * price
        { product: product, quantity: quantity, price: price, subtotal: subtotal }
      end
    end


end
