Blocipedia::Application.routes.draw do

  resources :charges, only: [:new, :create]

	match 'collaborations/remove/:id/:wiki_id', to: 'collaborations#remove', as: :collaborations_remove, via: [:get ,:post]
  resources :wikis do
    resources :pages, except: [:index], controller: 'wikis/pages'
  end

  #resources :wikis

  get "welcome/index"
  devise_for :users
  root 'welcome#index'
end
