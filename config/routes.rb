Rails.application.routes.draw do
  match '*path' => 'options_request#preflight', via: :options
  
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
