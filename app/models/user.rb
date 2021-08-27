class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  has_many :received_messages, foreign_key: :recipient_id, class_name: 'Message'
  has_many :sent_messages, foreign_key: :sender_id, class_name: 'Message'
end
