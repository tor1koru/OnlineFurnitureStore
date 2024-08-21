class Bucket < ApplicationRecord
  belongs_to :user
  has_many :bucket_items, dependent: :destroy
  has_many :products, through: :bucket_items
end
