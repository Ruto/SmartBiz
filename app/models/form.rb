class Form < ApplicationRecord
  belongs_to :structure
  belongs_to :user
end
