class Transaction < ApplicationRecord
  STATUS = %i(pending completed cancelled)

  belong_to :user
  belong_to :account
  has_one :order

  enum status: STATUS
end
