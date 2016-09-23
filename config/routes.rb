Rails.application.routes.draw do


  get 'home' => 'pages#home'
  get 'contact_us' => 'pages#contact_us'
  get 'faq' => 'pages#faq'
  get 'about' => 'pages#about'
  get 'legal' => 'pages#legal'
  get 'privacy' => 'pages#privacy_policy'

  get 'sign_up' => 'pages#mock_sign_up'
  get 'login' => 'pages#login'
  get 'logout' => 'pages#logout'

  resources :clients
  resources :providers


  scope '/provider' do
    get '/mock_login' => 'mock_demo#mock_login_provider'
    get '/landing' => 'pages#landing_provider', as: 'provider_landing'
    #get 'clients/:client_id/events/new' => 'events#new_provider', as: 'provider_events_new'
    
    resources :clients do 
    end
  end

  scope '/client' do
    get '/mock_login' => 'mock_demo#mock_login_client', as: 'client_mock_login'
    get '/landing' => 'pages#landing_client', as: 'client_landing'
    #get 'providers/:provider_id/events/new' => 'events#new_client', as: 'client_events_new'

    resources :providers do
    end
  end
  
  scope 'ui' do
    get 'clear_selected_profile', to: 'ui_state#clear_selected_profile', as: 'clear_selected_profile'
    get 'back_to_profile/event/:event_id', to: 'ui_state#back_to_profile', as: 'back_to_profile'
  end

  resources :events, except: [:new, :destroy] do
    resources :notes, except: [:destroy]
  end
  get '/events/:profile_type/:profile_id/new' => 'events#new', as: 'new_event'

  resources :searches, only: [:index, :create]

  get '/options/categories' => 'pages#category_options'

  root 'pages#home'

end
