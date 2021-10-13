class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
    @buys = Buy.all
  end

  def show
    @wallet = Wallet.find_by(wallet_name: params[:wallet_name])

    # これまでのgive
    give = Buy.where(giver_id: [@wallet.user_id])
    @give_count = give.count
    @give_quant = give.sum(:quantity)

    # これまでのtake
    take = Buy.where(taker_id: [@wallet.user_id])
    @take_count = take.count
    @take_quant = take.sum(:quantity)
  end
end

private
