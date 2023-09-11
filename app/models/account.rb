class Account < ApplicationRecord
  belongs_to :user
  has_many :account_transactions

  def decreate(amount)
    self.balance -= amount
    save!
  end

  def increate(amount)
    self.balance += amount
    save!
  end
end


# Sample: buy 0.0001 BTC by USDT, BTC price: 25k
# - create order buy BTC

# - create account_transaction buy BTC
# - increate account balance BTC

# - create account_transaction buy BTC
# - decreate account balance USDT



# Sample: buy 0.0001 BTC by USDT, BTC price: 25k
# - create order buy BTC

# - create account_transaction buy BTC
# - decreate account balance USDT

# - create account_transaction buy BTC
# - increate account balance BTC


# why decreate USDT account balance of user?
# - increate BTC balance expect to more user (balance user all user )
# - error handle more
# - Coffe House, hightland order -> paid -> take your drink
