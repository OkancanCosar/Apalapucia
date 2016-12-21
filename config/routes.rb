Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :appointments
  devise_for :workers,controllers: { registrations: 'worker/registrations' }
  devise_for :members,controllers: { registrations: 'member/registrations' }
  devise_for :companies,controllers: { registrations: 'company/registrations' }

  resources :announcaments
  get 'worker_work', to: 'worker_work#index'  #, as: "workerpage"
  get 'company_work', to: 'company_work#index'
  resources :seasons
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
