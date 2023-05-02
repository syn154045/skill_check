class Api::V1::PlanController < ApplicationController

  def index
    # CORS 対策
    response.set_header('access-control-allow-origin', 'http://localhost:3035')
    response.set_header('access-control-allow-methods', 'GET,POST,HEAD,OPTIONS')

    render json: {
      right: {
        initial_user_count: 3,
        initial_mbox_count: 2,
        base_monthly_cost:  12_800,
        user_monthly_cost:  2_000,
        mbox_monthly_cost:  2_000,
      },
      standard: {
        initial_user_count: 10,
        initial_mbox_count: 11,
        base_monthly_cost:  29_800,
        user_monthly_cost:  1_280,
        mbox_monthly_cost:  1_000,
      },
      premium: {
        initial_user_count: 50,
        initial_mbox_count: 51,
        base_monthly_cost:  76_800,
        user_monthly_cost:  980,
        mbox_monthly_cost:  500,
      },
    }
  end

end
