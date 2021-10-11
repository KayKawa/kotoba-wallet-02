# FormObject フォームオブジェクト
class BuyMessage
  include ActiveModel::Model
  attr_accessor :giver_id, :taker_id, :wallet_id, :statement_id, :quantity, :unit_price, :buy_id, :sender_id,
                :receiver_id, :message, :token

  def save
    # 購入情報を保存
    buy = Buy.create(giver_id: giver_id, taker_id: taker_id, wallet_id: wallet_id, statement_id: statement_id,
                     quantity: quantity, unit_price: unit_price)
    # メッセージを保存
    Message.create(buy_id: buy.id, sender_id: giver_id, receiver_id: taker_id, message: message)
  end
end
