class Cart

  def initialize(items = [])
    @items = items
  end

  def add_item(id)
    # find item .find is RUBY not active record .find
    item = @items.find { |item| item.product_id == id }

    # if item exists, + quantity
    if item
      item.increment
    else
      @items << CartItem.new(id)
    end
    # else push a new item
  end

  def empty?
    @items.empty?
  end

  attr_reader :items
  # 取代下面3 行
 # def items
 #   @items
 # end
  #

  def serialize
  # items = []
  # @items.each do |item|
  #   items << {product_id: item.product_id, quantity: item.quantity}
  # end
    # 用 map 取代上面的傳統做法。 .map 會回傳陣列
    items = @items.map { |item|
      {product_id: item.product_id, quantity: item.quantity}
    }

    {
      cart: {
        items: items
      }
    }
  end

  def self.build_from_hash(hash)
    if hash.nil?
      items = []
    else
    items = hash[:cart][:items].map do |item_hash|
         CartItem.new(item_hash[:product_id], item_hash[:quantity])
      end
    end

    Cart.new(items)


  end
end
