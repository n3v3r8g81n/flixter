Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  devise_scope :users do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
end
