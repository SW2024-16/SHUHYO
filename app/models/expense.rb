# app/models/expense.rb
class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
