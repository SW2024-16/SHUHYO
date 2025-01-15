module TransactionsHelper
  # Helper method to format the transaction amount
  def format_transaction_amount(amount)
    "#{number_with_delimiter(amount)}円"
  end

  # Helper method to display the category of a transaction
  def transaction_category_label(category)
    case category
    when 'Food'
      "🍔 Food"
    when 'Rent'
      "🏠 Rent"
    when 'Utilities'
      "💡 Utilities"
    else
      category
    end
  end

  # Helper method to check if a transaction is an expense
  def expense?(transaction)
    transaction.transaction_type == 'Expense'
  end

  # Helper method to display the date in a readable format
  def format_transaction_date(date)
    date.strftime("%m %d, %Y") # Example: "December 01, 2024"
  end
end
