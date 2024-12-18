class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy, :show]

  # New Expense Form
  def new
    @expense = Expense.new
  end

  # Create a new expense
  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to transactions_path, notice: 'Expense added successfully.'
    else
      render :new
    end
  end

  # Edit Expense Form (for individual expense)
  def edit
    # @expense is already set by before_action
  end

  # Update an individual expense
  def update
    if @expense.update(expense_params)
      redirect_to transactions_path, notice: 'Expense updated successfully.'
    else
      render :edit
    end
  end

  # Edit Expenses for a specific day (multiple expenses for the day)
  def edit_day
    @date = params[:date].to_date
    @expenses = Expense.where(date: @date.beginning_of_day..@date.end_of_day)
  end

  # Update expenses for a specific day (update all expenses for the day)
  def update_day
    # Ensure the date parameter is present
    if params[:date].present?
      @date = params[:date].to_date
      @expenses = Expense.where(date: @date.beginning_of_day..@date.end_of_day)

      # Iterate through each expense and update using the nested parameters
      params[:expenses].each do |expense_params|
        expense = @expenses.find { |e| e.id.to_s == expense_params[:id] }
        if expense
          expense.update(expense_params.permit(:name, :amount, :description))
        end
      end

      redirect_to transactions_path, notice: "Expenses for #{@date} updated successfully."
    else
      redirect_to transactions_path, alert: 'Date parameter is missing.'
    end
  end

  # Delete an individual expense
  def destroy
    @expense.destroy
    redirect_to transactions_path, notice: 'Expense deleted successfully.'
  end

  # Show an individual expense
  def show
    # @expense is already set by before_action
  end

  private

  # Set the expense for edit, update, destroy, and show actions
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Strong parameters for expense (for updating multiple expenses)
  def expense_params
    params.require(:expense).permit(:name, :amount, :date, :description)
  end
end
