class Organization < ApplicationRecord
  has_ancestry
  belongs_to :user
  has_many :structures, as: :structurable
end
