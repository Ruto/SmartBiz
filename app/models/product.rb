class Product < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_many :structures, as: :structurable

end
