Myapp::Application.routes.draw do


  if Rails.env.production?
    devise_for :users, :controllers => { :registrations => "admin/registrations" }
  else
    devise_for :users
  end


  resources :fireworks , :only => [:index] do
    collection do
      get 'type/:product_type'=> 'fireworks#index',as: :type
      get 'type/:product_type/:sub_type' => 'fireworks#index',as: :sub_type
    end
  end

  namespace :admin do
    resources :fireworks do
      collection do
        get 'type/:product_type'=> 'fireworks#index',as: :type
        get 'type/:product_type/:sub_type' => 'fireworks#index',as: :sub_type
      end
    end
    resources :slides do
    end
    resources :events do
    end
    get '/', :to => 'fireworks#index'
  end

  get 'about' => 'high_voltage/pages#show', id: 'about'
  root 'fireworks#home'
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
