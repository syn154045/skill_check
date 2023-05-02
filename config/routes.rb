Rails.application.routes.draw do

  get 'test', to: 'test#index'
  get 'plans', to: 'api/v1/plan#index'

end
