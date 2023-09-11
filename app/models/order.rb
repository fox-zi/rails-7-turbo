class Order < ApplicationRecord
  TYPE = %i(buy sell swap)

  enum type: TYPE

  belong_to :user
  has_one :transaction
end
