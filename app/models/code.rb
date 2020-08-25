class Code < ApplicationRecord
  belongs_to :codable, polymorphic: true
  belongs_to :user
end
