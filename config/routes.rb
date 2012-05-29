ChoiceIt::Application.routes.draw do

  root :to => 'events#index'
  resources :events

  match '/exception_test' => 'exception_test#error'
end
