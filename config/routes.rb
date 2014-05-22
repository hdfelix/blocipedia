Blocipedia::Application.routes.draw do

	resources :wikis do
		resources :pages, exept: [:index]
	end

	resources :wikis, only: [:index, :new, :create, :show]

  get "welcome/index"
  devise_for :users
	root 'welcome#index'
end
