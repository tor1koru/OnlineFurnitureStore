class BucketItem < ApplicationRecord
  belongs_to :bucket
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }
end
