require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart){ Cart.new }
  describe "calculator" do
    it "item can calculate it's total price itself" do
      p = create(:ruby_book, price: 50)
      # 可以另外給值 100 -> 50

      3.times { cart.add_item(p.id) }
      expect(cart.items.first.price).to be 150
    end
  end
end
