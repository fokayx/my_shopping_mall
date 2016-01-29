require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "add or get item from cart" do
    context "add 1 item" do
      it "Add a item to cart, then the cart won't be empty." do
        cart = Cart.new
        expect(cart).to be_empty
        cart.add_item(1)
        expect(cart).not_to be_empty
       # expect(cart.empty?).to be false 原寫法, rspec較口語
      end
    end

    context "add more same item" do
      it "Add more same items to cart, but itemcount won't change" do
        cart = Cart.new

        3.times { cart.add_item(1) }
        5.times { cart.add_item(2) }

        expect(cart.items.length).to be 2
        expect(cart.items.first.product_id).to be 1
        expect(cart.items.first.quantity).to be 3
        expect(cart.items.second.product_id).to be 2
        expect(cart.items.second.quantity).to be 5
      end
    end

    # Add more same items to cart, but the item count won't change.
    context "get item from cart" do
      it "Add more same items to cart, but the item count won't change."
    end
  end
end