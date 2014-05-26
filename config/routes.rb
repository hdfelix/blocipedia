Blocipedia::Application.routes.draw do

	resources :charges, only: [:new, :create]

	resources :wikis do
		resources :pages, except: [:index], controller: 'wikis/pages'
	end

	#resources :wikis

  get "welcome/index"
  devise_for :users
	root 'welcome#index'
end
