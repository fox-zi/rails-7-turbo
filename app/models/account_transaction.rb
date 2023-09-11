class AccountTransaction < ApplicationRecord
  STATUSES = %i(pending completed cancelled)

  belongs_to :user
  belongs_to :account
  belongs_to :order

  enum status: STATUSES
end
