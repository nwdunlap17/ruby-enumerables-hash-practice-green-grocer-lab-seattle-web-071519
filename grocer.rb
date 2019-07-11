def consolidate_cart(cart)
  checkoutLine = {}
  cart.size.times do |i|
    item = cart[i].keys[0]
    if checkoutLine[item] === nil 
      checkoutLine[item] = {:price => cart[i][item][:price], :clearance => false}
    end
  end
  return checkoutLine
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

cart = [
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
#      {"KALE" => {:price => 3.00, :clearance => false}},
#      {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
#      {"ALMONDS" => {:price => 9.00, :clearance => false}},
#      {"TEMPEH" => {:price => 3.00, :clearance => true}},
#      {"CHEESE" => {:price => 6.50, :clearance => false}},
#      {"BEER" => {:price => 13.00, :clearance => false}},
#      {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
#      {"BEETS" => {:price => 2.50, :clearance => false}},
#      {"SOY MILK" => {:price => 4.50, :clearance => true}}
    ]
    
puts consolidate_cart(cart)