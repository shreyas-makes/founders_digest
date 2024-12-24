Rails.application.routes.draw do
  # ActiveAdmin.routes(self)

  root 'pages#home'
  get 'apply', to: 'pages#apply'
  get 'start', to: 'pages#start'

  # This configuration sets up routes for user authentication using Devise.
  # It customizes the path names for signing in and signing up, and specifies a custom controller for registrations.
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'signup' }, controllers: { registrations: 'registrations' }
  # This line adds a custom route for logging out, which is handled by the 'pages#logout' action.
  get 'logout', to: 'pages#logout', as: 'logout'

  get 'stakeholder_updates/new', to: 'stakeholder_updates#new'

  resources :subscribe, only: [:index]
  resources :dashboard, only: [:index]
  resources :account, only: %i[index update] do
    get :stop_impersonating, on: :collection
  end
  resources :billing_portal, only: [:new, :create]
  resources :blog_posts, controller: :blog_posts, path: "blog", param: :slug

  resources :user_submissions, only: [:create, :update]

  # static pages
  pages = %w[
    privacy terms
  ]

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: page.gsub('-', '_').to_s
  end

  # admin panels
  # authenticated :user, lambda(&:admin?) do
  #   # insert sidekiq etc
  #   mount Split::Dashboard, at: 'admin/split'
  # end

  namespace  :admin do
    get '/', to: 'pages#dashboard'
    resources :user_submissions, only: [:update]
  end


end
