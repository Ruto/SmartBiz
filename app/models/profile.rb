class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :structure
  has_many :images, as: :imageable
end
