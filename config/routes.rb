Rails.application.routes.draw do
  root "users#new"
  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favorites, only: [:create, :destroy, :index]
end
