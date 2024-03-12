Rails.application.routes.draw do
  resources :courses
  resources :fields
  resources :students
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'courses/:id/group/:group_id', to: 'courses#grade', as: 'grade_course'
  get 'course/:id/group/:group_id/grade', to: 'courses#group_grade', as: 'grade_group'
  post 'course/:id/group/:group_id/save', to: 'courses#group_save', as: 'save_group'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
