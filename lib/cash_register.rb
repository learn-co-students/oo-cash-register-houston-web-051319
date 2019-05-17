require 'pry'

class CashRegister
    attr_accessor :total, :discount

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title,price,quantity=1)
        @items << {"Item": title, "Price": price, "Quantity": quantity}
        @previous_total = self.total
        self.total += (price*quantity)
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total *= (100-self.discount)/100.0
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        @items.map do | item |
            [item[:Item]] * item[:Quantity]
        end.flatten
    end

    def void_last_transaction
        self.total = @previous_total
    end
end
