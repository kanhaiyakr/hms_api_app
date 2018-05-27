Rails.application.routes.draw do
  # root :to => "welcome#index"

  resources :patients, only: [:create]
  resources :doctors, only: [:create]
  resources :appointments, only: [:create,:show]
  get 'appointment_list', to: 'appointments#appointment_list'

  # post "/patients", to: "patients#create"
  # post "/doctors", to: "doctors#create"
  # post "/appointments", to: "appointments#create"
end
