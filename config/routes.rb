Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root 'posts#index'
  root 'home#resume'
  get 'resume', to: 'home#resume'

  namespace :admin do
    namespace :custom do
      resources :posts
      resources :projects
    end
  end

  resources :posts, only: [:index, :show]
  resources :themes, only: [:index]
  resources :projects, only: [:index, :show]
end
