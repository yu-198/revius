Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

namespace :admins do
	resources :genres, only:[:index, :create, :update] do
		member do
			patch :enable
			patch :disable
		end
	end
	resources :users, only: [:index, :show, :edit, :update]
	resources :products, except: [:destroy]
	resources :orders, only: [:index, :show, :update]
end

resources :users, only: [:show, :edit, :update]
resources :orders, only: [:show, :new, :index, :create]
resources :products, only: [:show]
resources :cart_items, only: [:index, :create, :destroy]
resources :ship_to_addresses, only: [:index, :create, :destroy, :edit, :update]

root to: 'products#index'
get 'orders/finish' => 'orders#finish'
get 'home/about' => 'home#about'
get 'admins' => 'admins/orders#index'

end
