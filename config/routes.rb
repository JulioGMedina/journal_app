Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users,
             path: 'auth'

  resources :journal_entries

  resources :users, only: :edit do
    resources :journal_entries, controller: 'user_journal_entries'
  end
end
