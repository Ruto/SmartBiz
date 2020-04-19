class Structure < ApplicationRecord
  has_ancestry
  validates :name, presence: true
  validates_uniqueness_of :name, :alias

  belongs_to :user

end
