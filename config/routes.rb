Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schools, defaults: { format: 'json' }
  resources :news, defaults: { format: 'json' }
  resources :groups, :levels, defaults: { format: 'json' }
  resources :teachers, defaults: { format: 'json' }
  resources :parents, defaults: { format: 'json' }
  resources :students, defaults: { format: 'json' }

  devise_for :users
    devise_scope :user do
      authenticated :user do
        root 'home#index', as: :authenticated_root
      end
      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end
    
# Routes for photoalbums
  resources :albums do
    resources :photos
  end

  get 'album/new', to: 'albums#new'
  get '/albums/:id/edit', to: 'albums#edit'

end
