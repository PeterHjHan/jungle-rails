class Review < ActiveRecord::Base
  validates :product_id, presence: true
  validates :user_id, presence:true
  validates :rating, numericality: { in: 1..5 }
end


