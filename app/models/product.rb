class Product < ApplicationRecord
  has_many :tags
  has_many :categorizations
  has_many :categories, through: :categorizations
end
