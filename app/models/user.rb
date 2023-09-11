class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
  belongs_to :company

  has_many :orders
  has_many :account_transactions
  has_many :accounts

  def name
    email.split("@").first.capitalize
  end
end
