class Structure < ApplicationRecord
  has_ancestry
  belongs_to :structurable, polymorphic: true
  #validates :name, presence: true
  #validates_uniqueness_of :name
  belongs_to :user

end
