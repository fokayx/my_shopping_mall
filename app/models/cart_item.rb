class CartItem
  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  attr_reader :product_id, :quantity

 # def product_id
 #   @product_id
 # end

 # def quantity
 #   @quantity
 # end

  def increment
    @quantity = @quantity + 1
  end

  def product
    Product.find_by(id: product_id)
  end

  def price
    total = product.price * quantity
    # 這裡的product是上面的product方法。
    total = total - 100 if total >= 1000 and product.special_offer
    total
  end

end
