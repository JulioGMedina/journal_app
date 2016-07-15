Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users,
             path: 'auth'

  resources :journal_entries, only: :show

  resources :comments, only: [:create, :edit, :update, :destroy]

  resources :users, only: [:edit, :index] do
    resources :journal_entries, except: :show, controller: 'user_journal_entries'
  end
end
