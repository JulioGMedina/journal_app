Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users,
             path: 'auth'

  resources :journal_entries, only: :show

  resources :comments, only: [:create, :edit, :update, :destroy]

  resources :users, only: :index do
    resources :journal_entries, except: :show, controller: 'user_journal_entries' do
      get :download, on: :collection
    end
  end
end
