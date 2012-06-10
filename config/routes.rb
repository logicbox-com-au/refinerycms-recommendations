Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :recommendations do
    resources :recommendations, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :recommendations, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :recommendations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
