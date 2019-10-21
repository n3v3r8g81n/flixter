Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  devise_scope :users do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  resources :courses, only: [:index, :show]
  namespace :instructor do
    resources :sections, only: [] do
        resources :lessons, only: [:new, :create]
      end
          resources :courses, only: [:new, :create, :show] do
            resources :sections, only: [:new, :create]
        end
    end
end
