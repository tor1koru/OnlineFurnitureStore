class Product < ApplicationRecord
  belongs_to :category
  belongs_to :manufacturer, class_name: 'User', foreign_key: 'manufacturer_id'

  validates :price, presence: true, numericality: { greater_than: 0 }
end
