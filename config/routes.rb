Rails.application.routes.draw do
  resources :courses
  resources :fields
  resources :students
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'courses/:id/group/:group_id', to: 'courses#grade', as: 'grade_course'
  get 'course/:id/group/:group_id/grade', to: 'courses#group_grade', as: 'grade_group'
  post 'course/:id/group/:group_id/save', to: 'courses#group_save', as: 'save_group'
  get 'course/:id/group/:group_id/nograde', to: 'courses#nogroup_grade', as: 'nograde_group'

  get 'groups/:id/details', to: 'groups#details', as: 'details_group'
  get 'groups/:id/cleardetails', to: 'groups#cleardetails', as: 'cleardetails_group'
  get 'group/:id/attnds/:course_id', to: 'groups#attnds', as: 'attnds_group'
  get 'group/:id/attnds/:course_id/add', to: 'groups#addattnds', as: 'addattnds_group'
  post 'group/:id/attnds/:course_id/save', to: 'groups#saveattnds', as: 'saveattnds_group'
  get 'group/:id/attnds/:course_id/clear', to: 'groups#clearattnds', as: 'clearattnds_group'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "students#index"
end
