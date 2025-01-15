Rails.application.routes.draw do
  devise_for :users

  # Expenses routes (New, Create, Edit, Update, Destroy, Show, Index)
  resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy, :show] do
    collection do
      # Edit expenses for a specific day
      get 'edit_day', to: 'expenses#edit_day'
      # Update expenses for a specific day
      patch 'update_day', to: 'expenses#update_day'
    end
  end
  
  # Transactions routes
  resources :transactions, only: [:new, :create, :index]  # Adjust based on your needs

  # Root path (direct to transactions#index)
  root "transactions#index"  # Assuming your calendar or list of transactions is in transactions#index
  
  # Other resource routes
end
