Rails.application.routes.draw do

  resources :locations
  get 'forecast/forecasting'

  root 'dashboard#index', as: 'dashboard_index'
  resources :calls
  resources :employees
  resources :members
  resources :prospects
  resources :class_attendances
  resources :class_times
  resources :membership_types

  post '/convert_to_member', to: 'prospects#convert_to_member', as: 'convert_to_member'
  post '/did_show', to: 'prospects#did_show', as: 'did_show'
  post '/record_calls', to: 'calls#record_calls', as: 'record_calls'
  post '/dash_record_attendance', to: 'class_times#dash_record_attendance', as: 'dash_record_attendance'
  post '/employees/reactivate', to: 'employees#reactivate', as: 'reactivate'
  post '/class_times/reactivate', to: 'class_times#reactivate', as: 'reactivate_ct'
  post '/membership_types/reactivate', to: 'membership_types#reactivate', as: 'reactivate_mt'
  # post '/class_attendances/from_dashboard', to: 'class_attendances#dashboard', as: 'attendance_from_dash'
  get '/convert', to: 'prospects#convert', as: 'convert_prospect'
  get '/prospects/find_no_shows/:showed', to: 'prospects#find_no_shows', as: 'find_no_shows'
  get '/forecast', to: 'forecast#index', as: 'forecast_path'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard_path'
  get '/reports', to: 'reports#index', as: 'reports_path'
  get '/management', to: 'management#index', as: 'management_path'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
