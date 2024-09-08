Rails.application.routes.draw do
  # NON API
  get 'test' => 'test#index'
  
  # API
  namespace 'api' do
    namespace 'v1' do
      get 'plans' => 'plan#index'
      post 'calculate' => 'plan#calculate'
    end
  end
end
