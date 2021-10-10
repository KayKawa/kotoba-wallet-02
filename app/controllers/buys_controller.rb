class BuysController < ApplicationController
  def new
    @wallet = Wallet.find(params[:wallet_id])
    @buy = Buy.new
  end

  def create
    @wallet = Wallet.find(params[:wallet_id])
    # 通帳を保存
    @statement = Statement.create(minus: params[:quantity].to_i, wallet_id: params[:wallet_id])
    # 購入情報を保存

    @buy_message = BuyMessage.new(buys_params)
    @buy_message.save
    # WALLET残高の更新
    update_sum = @wallet.stock_quantity.to_i - params[:quantity].to_i
    if @wallet.update_column(:stock_quantity, update_sum.to_i)
      redirect_to wallets_path
    else
      render :new
    end
  end

  private

  def buys_params
    params.permit(:quantity, :unit_price, :message).merge(wallet_id: params[:wallet_id], statement_id: @statement.id,
                                                          giver_id: current_user.id, taker_id: @wallet.user_id)
  end
end
