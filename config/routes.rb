Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  resources :lists, path: '/', only: [:index, :show, :update]

  resources :items, only: [:create, :update] do
    collection do
      post 'create_or_update'
    end
  end

end
