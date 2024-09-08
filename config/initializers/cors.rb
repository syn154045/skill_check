Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # リクエストオリジン
    origins 'http://localhost:5173'
    
    # 許可するリソース
    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: true,        # cookieを使用するか
      expose: ['X-CSRF-Token']  # CSRFトークンをresponseに含める
  end
end
