require 'test_helper' 
  
class ProductTest < ActiveSupport::TestCase
	
	
	
	fixtures :products
  
  

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  
  
  test "Invalid with empty attributes  "  do
  	product =Product.new
  	assert !product.valid?
  	assert !product.errors.invalid?(:title)
  	assert !product.errors.invalid?(:description)
  	assert !product.errors.invalid?(:price)
  	assert !product.errors.invalid?(:image_url)
  end
  	
  test "positive price"  do
  	product =Product.new( :title => "My Book Title",
  	                      :description => "yyy" ,
  	                      :image_url =>"zzz.jpg")
  product.price = -1
  assert !product.valid?
  assert_equal "should be at least 0.01" , product.errors.on(:price)
  
  product.price =0
  assert !product.valid?
  assert_equal "should be at least 0.01" , product.errors.on(:price)
  
  product.price =1
  assert !product.valide?
  end
  
  
end
