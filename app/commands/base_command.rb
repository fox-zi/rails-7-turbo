class BuyCommand
  attr_reader :params, :user

  def initialize(user:, params: {})
    @params = params
    @user = user
  end

end
