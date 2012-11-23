class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
	
	validates :title, :description, :image_url, :presence => true
	validates :title, :uniqueness => true			
	validates :price, numericality: { greater_than: 0.01}
	validates :image_url, 
		allow_blank: true, 
		format: {
			with: %r{\.(gif|jpg|png)\Z}i,
			message: 'must be a URL for GIF, JPG or PNG image.'
		}

    has_many :line_items, dependent: :destroy

  	has_many :orders, through: :line_items 
end
