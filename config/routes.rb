Rails.application.routes.draw do

  root 'trang_chu#index', as: 'home'

  get '/store' => 'hang_hoas#index'

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'

  namespace :admin do
    resources :hang_hoas
    resources :danh_mucs
    resources :sessions, only: [:new, :create, :destroy]
    resources :moderators, only: [:index, :edit, :update]
  end

  resources :hang_hoas, only: [:index, :show]
  resources :danh_mucs, only: [:index, :show]

end
