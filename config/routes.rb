NewAuthDemo::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]

  namespace "api", :defaults => { :format => :json } do

    resources :photo_taggings, :only => [:create]
    resources :photos, :only => [:create] do
      resources :photo_taggings, only: [:index]
    end

    resources :users, :only => [] do
      resources :photos, :only => [:index, :show]
    end

  end

  root :to => "session#new"
end