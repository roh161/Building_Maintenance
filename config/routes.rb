# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  post 'building/new', to: 'building#create'
  delete '/building/:id', to: 'building#destroy', as: 'builiding_destroy'
  post '/building/:building_id/staffs/new', to: 'staffs#create'
  get '/building/:building_id/staffs/index', to: 'staffs#index', as: 'building_staff_index'
  delete 'staffs/destroy/:id/:bid', to: 'staffs#destroy', as: 'staffdestroyer'
  post '/building/:building_id', to: 'home#create'
  get '/building/:building_id/home/showclients', to: 'home#showclients', as: 'building_clients'
  resources 'maintenances'
  get 'maintenances/:user_id', to: 'maintenances#index', as: 'request'
  post 'maintenances/new', to: 'maintenances#create'
  get 'edit/:id', to: 'maintenances#edit', as: 'update'
  post 'update/:id', to: 'maintenances#update', as: 'owner_comment'
  get 'payment/:building_id/:maintenance_cost', to: 'home#payment', as: 'payment'
  post 'charge', to: 'home#charge', as: 'charge'
  get 'total_building_balance/:id', to: 'home#total_building_balance', as: 'check_building_balance'

  resources 'building' do
    resources 'staffs', only: %i[new]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    password: 'users/password',
    registrations: 'users/registrations'
  }
end
