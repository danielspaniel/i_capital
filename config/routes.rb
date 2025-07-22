Rails.application.routes.draw do
  resources :partners, only: [ :index ] do
    resources :investors, only: [ :index, :show, :new, :create ]
  end

  root "partners#index"
end
