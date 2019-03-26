class Review < ActiveRecord::Base
  belongs_to :product
  validates :product_id, presence: true 
  validates :description, presence: true 
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 
end
