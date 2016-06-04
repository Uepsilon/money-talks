class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: 'User'

  validates :recipient, presence: true
  validates :sender_id, presence: true

  validates :sender_name, presence: true
  validates :iban, presence: true

  validates :message, presence: true
  validates :recieved_at, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_id, presence: true, uniqueness: true
end
