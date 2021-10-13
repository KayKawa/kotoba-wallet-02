class PurchasesController < ApplicationController
  def new
    @wallet = Wallet.find_by(wallet_name: params[:wallet_wallet_name])
    @purchase = Purchase.new
  end

  def create
    @wallet = Wallet.find_by(wallet_name: params[:wallet_wallet_name])
    @purchase_statement = PurchaseStatement.new(purchases_params)
    if @purchase_statement.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: purchases_params[:quantity].to_i * 10, # 商品の値段
        card: purchases_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_statement.save
      redirect_to wallets_path
    else
      render :new
    end
  end
end

private

def purchases_params
  params.require(:purchase).permit(:quantity).merge(wallet_id: @wallet.id,
                                                    wallet_name: @wallet.wallet_name).merge(token: params[:token])
end
