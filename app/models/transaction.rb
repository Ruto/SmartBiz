class Transaction < ApplicationRecord
  belongs_to :transactionable, polymorphic: true
  belongs_to :structure
  belongs_to :image
  belongs_to :account
  belongs_to :user
end
