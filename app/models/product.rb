class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders , :through => :line_items
	def self.find_products_for_sale
		find(:all , :order =>"title")
	end
	
	
	# validation 设置
	validates_presence_of :title ,:description ,:image_url,
	                      :message =>'必填区域'
	validates_numericality_of :price
	validate :price_must_be_at_least_a_cent
	validates_uniqueness_of :title
	validates_format_of :image_url,
	                     :with => %r{\.(gif|jpg|png)$}i,
	                     :message =>"必须jpg，gif，png文件格式的有效URL地址"
	
	                     
	
	
	protected 
	def price_must_be_at_least_a_cent
		errors.add(:price,'价格至少是1分') if price.nil? ||price<0.01
	end	
	
end
