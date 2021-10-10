# Formオブジェクト
class PurchaseStatement
  include ActiveModel::Model
  attr_accessor :wallet_id, :statement_id, :quantity, :plus, :stock_quantity, :token

  def save
    # 通帳を保存
    statement = Statement.create(plus: quantity, wallet_id: wallet_id)
    # 発行情報を保存

    Purchase.create(quantity: quantity, wallet_id: wallet_id, statement_id: statement.id)

    # WALLET残高の更新
    wallet = Wallet.find(wallet_id)
    update_sum = wallet.stock_quantity.to_i + quantity.to_i
    wallet.update_column(:stock_quantity, update_sum.to_i)
  end
end
