
class CashRegister
  attr_accessor :total, :discount, :items, :most_recent_add, :most_recent_quantity, :most_recent_item
 
  def initialize(discount = 0)
  @discount = discount  
  @total = 0 
  @items = []
  end
  
  def self.total
    @total
  end
  
  def add_item(item, price, quantity = 1)
    @total += price * quantity
    @most_recent_add = price * quantity
    @most_recent_item = item
    @most_recent_quantity = quantity
    if quantity == 1 
      @items << item
    else 
      quantity.times do 
        @items << item 
      end
    end
  end
  
  def apply_discount
    if @discount > 0
    discount_dollars = (@total/100 * @discount) 
    @total -= discount_dollars
    return "After the discount, the total comes to $#{@total}."
  else
    return "There is no discount to apply."
  end
end
  
  
  def items
    @items
  end
  
  def void_last_transaction
    latest_item = @most_recent_item
    @total = @total - @most_recent_add
    if @most_recent_quantity = 1
      items.delete(latest_item)
    else
      @most_recent_quantity.times do 
        items.delete(latest_item)
      end
    end
  end
end