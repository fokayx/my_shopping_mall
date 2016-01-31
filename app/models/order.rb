class Order < ActiveRecord::Base
  has_many :order_items

  default_scope {where(deleted_at.nil?)}

  def deleted?
    deleted_at.present?
    #訂單是否已刪除,不要真的刪
  end

  state_machine :initial => :pending do
    event :confirm do
      transition :pending => :confirmed
    end

    event :ship do
      transition :confirm => :shipping
    end

    event :deliver do
      transition :ship => :delivered
    end

    event :refund do
      transition :confirm => :refunded
    end

    event :complian_shipping do
      transition :shipping => :complained
    end
    event :complian_deliver do
      transition :delivered => :complained
    end
  end
end
