require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "add or get item from cart" do
    # Add a item to cart, then the cart won't be empty.
    context "add 1 item" do
      it "Add a item to cart, then the cart won't be empty." do
        cart = Cart.new
        expect(cart).to be_empty
        cart.add_item(1)
        expect(cart).not_to be_empty
       # expect(cart.empty?).to be false 原寫法, rspec較口語
      end
    end

    # After the item added to cart, you can get the item back from the cart.
    context "add more same item" do
      it "After the item added to cart, you can get the item back from the cart."
    end

    # Add more same items to cart, but the item count won't change.
    context "get item from cart" do
      it "Add more same items to cart, but the item count won't change."
    end
  end
end
