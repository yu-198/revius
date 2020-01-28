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
	resources :genres, only: [:index, :create, :update, :edit] do
		member do
			patch :enable
			patch :disable
		end
	end
	resources :users, only: [:index, :show, :edit, :update] do
		member do
			patch :available
			patch :unavailable
		end
	end
	resources :products, except: [:destroy]
	resources :orders, only: [:index]
	resources :article, except: [:destroy]
end

resources :users, only: [:show, :edit, :update] do
	member do
		 patch :leave
	end
end
resources :orders, only: [:create, :index] do
	  collection {get "finish"}
    end
resources :products, only: [:show]
resources :cart_items, only: [:index, :create, :destroy]
resources :article, only:[:show]

root to: 'products#index'

get 'home/about' => 'home#about'
get 'admins' => 'admins/home#top'
patch :cart_items, to: 'cart_items#update_all'
delete :cart_items, to: 'cart_items#destroy_all'

end
