Rails.application.routes.draw do

  # require 'sidekiq/web'
# ...
#   mount Sidekiq::Web, at: '/sidekiq'

  api_version(:module => "Api::V1", path: {value: 'v1'}) do
    resources :robots, :agv, :nc, :defaults => { :format => 'json' }
    resources :production_orders, defaults: {format: 'json'} do
    end
    resources :locations, defaults: {format: 'json'} do
      collection do
        patch "actions/bind_barcode", to: "locations#bind_barcode"
        patch "actions/in_stock", to: "locations#in_stock"
        patch "actions/out_stock", to: "locations#out_stock"
      end

    end
    resources :products, defaults: {format: 'json'} do

    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

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
