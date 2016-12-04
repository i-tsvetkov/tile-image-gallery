Rails.application.routes.draw do
  get 'gallery/init'

  get 'new', to: 'new#index'

  get 'gallery/:id', 		to: 'gallery#init'
  get 'gallery/:id/:width', to: 'gallery#index'

  get 'gallery', to: 'new#index'

  post 'new', to: 'new#upload'

  get '/', to: 'new#index'

  match '*_', via: [:get, :post], to: redirect('/404')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
