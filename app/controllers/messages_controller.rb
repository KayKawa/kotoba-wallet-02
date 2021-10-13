class MessagesController < ApplicationController
  def index
    @wallet = Wallet.find(params[:wallet_id])

    # これまでのgive
    give = Buy.where(giver_id: [@wallet.user_id])
    @give_count = give.count
    @give_quant = give.sum(:quantity)

    # これまでのtake
    take = Buy.where(taker_id: [@wallet.user_id])
    @take_count = take.count
    @take_quant = take.sum(:quantity)

    @send_message = Message.where(sender_id: [@wallet.user_id])
    @receive_message = Message.where(receiver_id: [@wallet.user_id])
  end
end
