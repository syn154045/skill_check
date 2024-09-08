class Api::V1::PlanController < ApplicationController
  # postman於 POSTテスト送信時用としてトークン検証をスキップ
  # skip_before_action :verify_authenticity_token, only: [:calculate]
  
  def index
    # CORS 対策
    response.set_header('access-control-allow-origin', 'http://localhost:3035')
    response.set_header('access-control-allow-methods', 'GET,POST,HEAD,OPTIONS')
    
    plan = Plan.new
    plans = plan.all
    render json: plans
  end

  def calculate
    # リクエストパラメータ
    users = params[:users].to_i
    mboxes = params[:mboxes].to_i

    # 空の場合(NULL, 0)はエラーレスポンス
    if users <= 0 || mboxes <= 0
      render json: { error: '値を入力してください' }, status: :bad_request
    else
      plan, detail, extra_user_count, extra_mbox_count, total_price = Plan.calculate(users, mboxes)
      render json: {
        plan: plan,
        detail: detail,
        extra_user_count: extra_user_count,
        extra_mbox_count: extra_mbox_count,
        total_price: total_price
      }
    end
  end

end
