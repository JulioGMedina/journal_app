Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users,
             path: 'auth'

  resources :journal_entries, only: :show

  resources :users, only: [:edit, :index] do
    resources :journal_entries, except: :show, controller: 'user_journal_entries'
  end
end
