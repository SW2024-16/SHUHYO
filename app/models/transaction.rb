class Transaction < ApplicationRecord
  validates :date, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :category, presence: true
end
