class Plan
  PLANS = {
    light: {
      initial_user_count: 3,
      initial_mbox_count: 2,
      base_monthly_cost: 12_800,
      user_monthly_cost: 2_000,
      mbox_monthly_cost: 1_500
    },
    standard: {
      initial_user_count: 10,
      initial_mbox_count: 11,
      base_monthly_cost: 29_800,
      user_monthly_cost: 1_280,
      mbox_monthly_cost: 1_000
    },
    premium: {
      initial_user_count: 50,
      initial_mbox_count: 51,
      base_monthly_cost: 76_800,
      user_monthly_cost: 980,
      mbox_monthly_cost: 500
    }
  }
  
  def all
    PLANS
  end

  def self.calculate(users, mboxes)
    # Lightプランの上限値を超過した場合に除外
    valid_plans = PLANS.map { |plan, details|
      # 追加ユーザ数
      extra_user_count = [users - details[:initial_user_count], 0].max
      # 追加受信箱数
      extra_mbox_count = [mboxes - details[:initial_mbox_count], 0].max
      
      # lightプランかつ、追加ユーザ・受信箱の上限を超過する場合、無効とする
      if plan == :light
        max_extra_user_count = 4
        max_extra_mbox_count = 3
        
        if (extra_user_count > max_extra_user_count) || (extra_mbox_count > max_extra_mbox_count)
          next
        end
      end
      
      # 追加料金
      extra_cost = (extra_user_count * details[:user_monthly_cost]) + (extra_mbox_count * details[:mbox_monthly_cost])
      
      # premiumプランかつ、100ユーザ・100受信箱を超過する場合、追加料金を半額とする
      if plan == :premium && users >= 100 && mboxes >= 100
        extra_cost = extra_cost / 2
      end
      
      # 合計額
      total_price = details[:base_monthly_cost] + extra_cost
      
      [plan, details, extra_user_count, extra_mbox_count, total_price]
    }.compact
    
    valid_plans.min_by { |_, _, _, _, total_price| total_price }
      # .tap { |result| result.pop }     # total_priceを除外
  end
end
