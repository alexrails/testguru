Rails.application.routes.draw do
#  get 'tests/index'
#  get 'tests/new'
#  get 'tests/create'
#  get 'tests/show'
#  get 'tests/destroy'
#  get 'questions/index'
#  get 'questions/show'
#  get 'questions/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true
  end
end
