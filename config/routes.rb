Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :users, only: %i[index create] do
      collection do
        get :user, to: 'users#show'
      end
    end

    resources :concerts, only: %i[index create]
    resources :comments, only: %i[index create]
  end
end
