def consolidate_cart(cart)
  checkoutLine = {}
  cart.size.times do |i|
    item = cart[i].keys[0]
    if checkoutLine[item] === nil 
      checkoutLine[item] = {:price => cart[i][item][:price], :clearance => cart[i][item][:clearance], :count => 1}
    else
      checkoutLine[item][:count] += 1
    end
  end
  return checkoutLine
end

def apply_coupons(cart, coupons)
  coupons.size.times do |i|
    item = coupons[i][:item]
    quantity = coupons[i][:num]
    new_price = coupons[i][:cost]/quantity
    
    if cart[item] != nil
      if cart[item][:count] >= quantity
        cart[item][:count] -= quantity
        
        if cart[item+" W/COUPON"] == nil
          cart[item+" W/COUPON"] = {:price => new_price, :clearance => cart[item][:clearance], :count => quantity}
          
        else
          cart[item+" W/COUPON"][:count]+=quantity
        end
      end
    end
  end
  return cart
end

def apply_clearance(cart)
  p cart
  cart.each do |item|
    p item
  end
  return cart
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
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
      {"KALE" => {:price => 3.00, :clearance => false}},
#      {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
#      {"ALMONDS" => {:price => 9.00, :clearance => false}},
#      {"TEMPEH" => {:price => 3.00, :clearance => true}},
#      {"CHEESE" => {:price => 6.50, :clearance => false}},
#      {"BEER" => {:price => 13.00, :clearance => false}},
#      {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
#      {"BEETS" => {:price => 2.50, :clearance => false}},
#      {"SOY MILK" => {:price => 4.50, :clearance => true}}
    ]
    
coupons = [
      {:item => "AVOCADO", :num => 2, :cost => 5.00},
      {:item => "AVOCADO", :num => 2, :cost => 5.00}
      #{:item => "BEER", :num => 2, :cost => 20.00},
      #{:item => "CHEESE", :num => 3, :cost => 15.00}
    ]    

cart = consolidate_cart(cart)
#apply_coupons(cart,coupons)
puts apply_clearance(cart)