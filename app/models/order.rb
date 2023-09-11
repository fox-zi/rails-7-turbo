class Order < ApplicationRecord
  TYPES = %i(buy sell swap)

  enum type: TYPES

  belongs_to :user
  has_one :account_transaction
end
