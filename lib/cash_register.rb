
class CashRegister
  attr_accessor :total, :discount, :items, :most_recent_add, :most_recent_quantity, 
  latest_item = []
  latest_total = 0
  latest_quantity = 1
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
    latest_item = item
    latest_quantity = quantity
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
    @total = @total - @most_recent_add
    if latest_quantity = 1
      items.delete(latest_item)
    else
      latest_quantity.times do 
        items.delete(latest_item)
      end
    end
  end
end