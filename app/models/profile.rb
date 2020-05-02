class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :structure
end
