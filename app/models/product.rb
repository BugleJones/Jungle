class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true


  # Product Status Badges
  
  def sold_out?
    quantity == 0
  end

  def few_left?
    quantity.between?(1, 5)
  end

end
