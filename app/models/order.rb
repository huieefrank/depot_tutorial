class Order < ActiveRecord::Base
	has_many :line_items
	
	PAYMENT_TYPES = [
	        # Dispalyed      stored in database
	        ["Check",          "check"],
	        ["Credit Cart",     "cc"],
	        ["Purchase Order" , "order"]
           ]
           
           
   validates_presence_of :name, :email , :address , :pay_types
   validates_inclusion_of :pay_types , :in =>
                     PAYMENT_TYPES.map { |dispaly ,value| value }
                     
                     
    def add_line_items_from_cart(cart)
    	cart.items.each do |item|
    		li = LineItem.from_cart_item(item)
    		line_items << li
		end
	end
	
end
