class Account < ApplicationRecord
  has_many :transactions
  belong_to :user
end


# Sample: buy 0.0001 BTC by USDT, BTC price: 25k
# - create order buy BTC

# - create transaction buy BTC
# - increate account balance BTC

# - create transaction buy BTC
# - decreate account balance USDT



# Sample: buy 0.0001 BTC by USDT, BTC price: 25k
# - create order buy BTC

# - create transaction buy BTC
# - decreate account balance USDT

# - create transaction buy BTC
# - increate account balance BTC


# why decreate USDT account balance of user?
# - increate BTC balance expect to more user (balance user all user )
# - error handle more
# - Coffe House, hightland order -> paid -> take your drink
