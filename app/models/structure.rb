class Structure < ApplicationRecord
  has_ancestry
  validates :name, presence: true
  validates_uniqueness_of :name 
  belongs_to :user

end
