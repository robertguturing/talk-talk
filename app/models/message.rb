class Message < ApplicationRecord
  validates :text, presence: true
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
