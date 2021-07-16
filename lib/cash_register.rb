require 'pry'

class CashRegister

    attr_accessor :total

    def initialize(employee_discount=0)
        @employee_discount = employee_discount
        @total = 0
        @added_items = []
        @last_transaction = 0
    end

    def discount 
        @employee_discount
    end

    def items
        @added_items
    end

    def add_item(item, price, quantity = 1)
        @last_transaction = price * quantity
        self.total += price * quantity
        quantity.times do
         @added_items << item
        end
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total * ((100 - self.discount.to_f)/ 100)
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @added_items 
    end

    def void_last_transaction
     self.total -= @last_transaction
    end

end

# binding.pry