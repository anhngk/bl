Rails.application.routes.draw do

  resources :chi_tiet_gio_hangs
  resources :gio_hangs
  resources :don_hangs
  devise_for :views
  devise_for :khach_hangs
  
  root 'trang_chu#index', as: 'home'

  get '/store' => 'hang_hoas#index'

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy' 

  namespace :admin do
    resources :thong_kes, only: [:index]
    resources :don_hangs
    resources :khach_hangs
    resources :hang_hoas
    resources :danh_mucs
    resources :sessions, only: [:new, :create, :destroy]
    resources :moderators, only: [:index, :edit, :update]
  end

  resources :hang_hoas, only: [:index, :show]
  resources :danh_mucs, only: [:index, :show]

end
