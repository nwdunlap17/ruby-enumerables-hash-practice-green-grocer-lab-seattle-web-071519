def consolidate_cart(cart)
  checkoutLine = {}
  cart.each do |item|
    if checkoutLine[item] != nil 
      checkoutLine.item = item
    end
  end   
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  sum = 0 
  cart.each do |item|
    sum += item[:price]
  end
  return sum
end
