# coding: UTF-8
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Atrybuty produktu nie mogą byc puste" do
	  product = Product.new
	  assert product.invalid?
	  assert product.errors[:title].any?
 	  assert product.errors[:description].any?
 	  assert product.errors[:price].any?
    assert product.errors[:image_url].any?  
  end

	test "Cena musi być większa od zera" do
    product = Product.new(title: "Moja ksiązka", description: "Loren ipsum dolor", image_url: "zzz.jpg")
    product.price = -1
    assert product.invalid?

    product.price = 0
    assert product.invalid?

    product.price = 1
    assert product.valid?
	end

  def new_product(image_url)
    Product.new(title:       "Moja książka",
                description: "Lorem ipsum dolor",
                price:       1,
                image_url:   image_url)
  end


  test "URLem mogą prowadzić tylko do obrazków" do
    ok = %w{ obr.gif obr.jpg obr.png obr.JPG obr.Jpg
             http://a.b.c/x/y/z/obr.gif }
    bad = %w{ obr.doc obr.gif/more obr.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, 
        "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?,
        "#{name} shouldn't be valid"
    end
  end
end
