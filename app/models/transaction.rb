class Transaction < ApplicationRecord
  belongs_to :payable, polymorphic: true
  belongs_to :structure
  belongs_to :image
  belongs_to :account
  belongs_to :user
  has_many :images, as: :imageable
end
