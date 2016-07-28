Rails.application.routes.draw do
  devise_for :couples, controllers: { registrations: "registrations" }

  get 'couples/:id/edit-profile' => 'couples#edit', as: :my_profile
  patch  'couples/:id', to: 'couples#update'
  get    "couples/:id",      to: "couples#show", as: :couple_profile

  root to: 'pages#home'

  get 'challenges', to: 'pages#challenges'

    resources :couples do
        get 'my_events', to: 'events#my_events'
      resources :events do
        resources :swipes
        post 'swipeleft', to: 'swipes#guest_swipe_left'
        post 'swiperight', to: 'swipes#guest_swipe_right'
      end
    end

    resources :events do
      resources :couples do
        post 'swipeleft', to: 'swipes#organiser_swipe_left'
        post 'swiperight', to: 'swipes#organiser_swipe_right'
      end
    end

  namespace :organiser do
    resources :events do
      resources :couples
    end
  end

  resources :messages, only: [:new, :create, :destroy]

  resources :events do
    patch :notification_false
  end

  # Attachinary route
  mount Attachinary::Engine => "/attachinary"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
