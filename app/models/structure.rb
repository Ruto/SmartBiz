class Structure < ApplicationRecord
  has_ancestry
  belongs_to :structurable, polymorphic: true
  #validates :name, presence: true
  #validates_uniqueness_of :name
  belongs_to :user


  include WorkflowActiverecord
  workflow do
    state :new do
      event :submit, :transitions_to => :awaiting_confirmation
    end
    state :awaiting_confirmation do
      event :confirm, :transitions_to => :being_confirmed
    end
    state :being_confirmed do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :accepted
    state :rejected
  end

end
