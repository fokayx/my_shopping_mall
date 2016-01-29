class Cart

  def initialize
    @items = []
  end

  def add_item(product_id)
    @items << product_id
  end

  def empty?
    if @items.empty?
      true
    else
      false
    end
  end
end
