Rails.application.routes.draw do

  root 'trang_chu#index'

  get 'admin/NhaCungCap'

  resources :chi_tiet_gio_hangs
  resources :gio_hangs
  resources :don_hangs
  devise_for :views
  devise_for :khach_hangs, controllers: {registrations: "registrations"}

  get '/store' => 'hang_hoas#index'
  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'
  post '/recommend' => 'hang_hoas#recommend'
  post '/rate' => 'rater#create', :as => 'rate'

  namespace :admin do
    resources :thong_kes, only: [:index]
    resources :don_hangs
    resources :khach_hangs
    resources :nha_cung_caps
    resources :hang_hoas
    resources :danh_mucs
    resources :sessions, only: [:new, :create, :destroy]
    resources :moderators, only: [:index, :edit, :update]
    resources :hoa_don_nhaps
    resources :hoa_don_xuats
  end

  resources :hang_hoas, only: [:index, :show]  do
    member do
      get :recommend
    end
  end
  resources :danh_mucs, only: [:index, :show]

end
