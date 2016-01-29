class Cart

  def initialize
    @items = []
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

  def items
    @items
  end
end
