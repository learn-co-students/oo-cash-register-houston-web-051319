
class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, amount, quantity=1)
        self.total += amount * quantity
        quantity.times do
            items << title
        end
        self.last_transaction = amount * quantity
    end

    def apply_discount
        if discount!=0
            self.total = total-((total*discount)/100)
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
      end
end