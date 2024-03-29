Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :sessions, only: %i[create destroy index]

  scope ":handle" do
    resources :events do
      resources :chapters
    end
  end
end
