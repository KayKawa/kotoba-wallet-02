class Buy < ApplicationRecord
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
  belongs_to :wallet
  belongs_to :statement
  has_one :message
end
