class PurchasesController < ApplicationController
  def new
    @wallet = Wallet.find(params[:wallet_id])
    @purchase = Purchase.new
  end

  def create
    @wallet = Wallet.find(params[:wallet_id])
    @purchase_statement = PurchaseStatement.new(purchases_params)
    if @purchase_statement.save
      redirect_to wallets_path
    else
      render :new
    end
  end
end

private

def purchases_params
  params.require(:purchase).permit(:quantity).merge(wallet_id: params[:wallet_id])
end
