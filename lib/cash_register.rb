class CashRegister

    attr_accessor :total, :discount


    def initialize(discount = 0)
        @total = 0.0
        @discount = discount.to_f
        @items = Array.new
        @sum = Array.new
    end

    def add_item(title, price, quantity = 0)
        if quantity != 0
            @sum << price * quantity
            @items.fill(title, @items.size, quantity)
        else
            @sum << price 
            @items << title
        end
        @total = @sum.inject {|sum, i|  sum + i }
    end

    def apply_discount
        if @discount > 0
        converted_discount = @discount / 100
        actual_dicount =  total * converted_discount
        @total -= actual_dicount
        return "After the discount, the total comes to $#{@total.to_i}."
        end
        return "There is no discount to apply."
    end

    def items
        @items
    end

    def void_last_transaction
        @items.pop
        @sum.pop
        @total = @sum.inject {|sum, i|  sum + i }
        return total if @sum.length == 0
    end

    def void_last_transaction
        @items.pop
        @sum.pop
        if @sum.size > 0
          @total = @sum.inject {|sum, i|  sum + i } 
        else
          @total = 0.0
        end
    end

end