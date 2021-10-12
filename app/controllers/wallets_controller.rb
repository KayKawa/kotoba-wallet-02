class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
  end

  def show
    @wallet = Wallet.find(params[:id])
    @find_give = @wallet
  end
end

private
