require 'rails_helper'

RSpec.describe Cart, type: :model do
  # before :each do
  #   @cart = Cart.new
  # end
  # 用let 就不用把下面的cart 再加上"@"
  let(:cart) { Cart.new }
  describe "add or get item from cart" do
    context "add 1 item" do
      it "Add a item to cart, then the cart won't be empty." do
        # cart = Cart.new
        expect(cart).to be_empty
        cart.add_item(1)
        expect(cart).not_to be_empty
       # expect(cart.empty?).to be false 原寫法, rspec較口語
      end
    end

    context "add more same item" do
      it "Add more same items to cart, but itemcount won't change" do
        # Cart = Cart.new

        3.times { cart.add_item(1) }
        5.times { cart.add_item(2) }

        expect(cart.items.length).to be 2
        expect(cart.items.first.product_id).to be 1
        expect(cart.items.first.quantity).to be 3
        expect(cart.items.second.product_id).to be 2
        expect(cart.items.second.quantity).to be 5
      end
    end

    context "get item from cart" do
      it "After the item added to cart, you can get the item back from the cart." do
        # cart = Cart.new
        p1 = create(:ruby_book)
        p2 = create(:php_book)
        4.times { cart.add_item(p1.id) }
        2.times { cart.add_item(p2.id) }

        expect(cart.items.first.product_id).to be p1.id
        expect(cart.items.second.product_id).to be p2.id 
        expect(cart.items.first.product).to be_a Product
      end
    end

    context "cart serialize" do
        context "cart to hash" do
          it "serialize it's items to hash structure" do

            3.times { cart.add_item(2) }
            4.times { cart.add_item(5) }

            result_hash = {
              cart: {
                items: [
                  {product_id: 2, quantity: 3},
                  {product_id: 5, quantity: 4}
                ]
              }
            }
            
            expect(cart.serialize).to eq result_hash
          end
        end

      context "hash to cart" do
        it "rebuilt by import a hash structre" do
            result_hash = {
              cart: {
                items: [
                  {product_id: 2, quantity: 3},
                  {product_id: 5, quantity: 4}
                ]
              }
            }
            cart = Cart.build_from_hash(result_hash)
            expect(cart.items.first.product_id).to be 2
            expect(cart.items.first.quantity).to be 3
            expect(cart.items.second.product_id).to be 5
            expect(cart.items.second.quantity).to be 4

        end
      end

      context "calculator" do
        it "calculate total price of this cart" do
          p1 = create(:ruby_book, price: 1000)
          p2 = create(:php_book, price: 100)

          3.times {
            cart.add_item(p1.id)
            cart.add_item(p2.id)
          }
          expect(cart.total_price).to be 3300
        end
      end

    end
    
    describe "special events" do
      context "Xmas" do
        it "10% off on Xmas" do
          p = create(:ruby_book, price: 10)
          10.times { cart.add_item(p.id)}
          
          Timecop.travel(2015, 12, 25) do
            expect(cart.total_price).to be (100 * 0.9)
          end
        end

      end
    end
  end
end
