class BuyCommand
  prepend SimpleCommand

  attr_reader :params, :user

  def initialize(user:, params: {})
    @params = params
    @user = user
  end

  def call
    validate!

    base_account.with_lock do
      create_order
      create_account_transaction
      decreate_account
      increate_account
    end

    create_order
  end

  private

  def amount
    @amount ||= BigDecimal(params[:amount])
  end

  def currency
    @currency ||= params[:currency]
  end

  def buy_account
    @buy_account ||= Account.find_or_create_by!(currency:, user_id: user.id)
  end

  def base_currency
    @base_currency ||= params[:base_currency]
  end

  def base_account
    @base_account ||= Account.lock.find_by(currency: base_currency, user_id: user.id)
  end

  def validate!
    return if base_account.balance >= amount
    raise StandardError, 'Amount greater than your balance'
  end

  def create_order
    @create_order ||= user.orders.create(
      amount:,
      base_currency:,
      currency:,
    )
  end

  def create_account_transaction
    buy_account.account_transactions.create(
      user:,
      status: AccountTransaction::statuses[:completed],
      order: create_order
    )
  end

  def decreate_account
    base_account.decreate(amount)
  end

  def increate_account
    buy_account.increate(amount)
  end
end
#

# BuyCommand.call(user: User.last, params: { amount: '1', price: 1, currency: 'BTC', base_currency: 'USDT' })
