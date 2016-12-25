Rails.application.routes.draw do


  get 'ilanlar', to: 'home#ilanlar'
  resources :seasons
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :appointments
  devise_for :workers,controllers: { registrations: 'worker/registrations' }
  devise_for :members,controllers: { registrations: 'member/registrations' }
  devise_for :companies,controllers: { registrations: 'company/registrations' }

  resources :announcaments
  get 'worker_work', to: 'worker_work#index'  #, as: "workerpage"

  get 'company_work', to: 'company_work#index'


  put 'registered', to: 'company_work#registered'
  put 'unregistered', to: 'company_work#unregistered'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
