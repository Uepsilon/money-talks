class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  validates :recipient, presence: true

  validates :sender_name, presence: true, unless: :sender?
  validates :iban, presence: true, unless: :sender?

  validates :message, presence: true
  validates :recieved_at, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_id, presence: true, uniqueness: true

  def sender?
    sender.present?
  end
end
