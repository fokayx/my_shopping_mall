class Order < ActiveRecord::Base
  has_many :order_items

  state_machine :initial => :pending do
    event :confirm do
      transition :pending => :confirmed
    end

    event :ship do
      transition :confirm => :shipping
    end

    event :deliver do
      transistion :ship => :delivered
    end

    event :refund do
      transistion :confirm => :refunded
    end

    event :complian_shipping do
      transition :shipping => :complained
    end
    event :complian_deliver do
      transition :delivered => :complained
    end
  end
end
