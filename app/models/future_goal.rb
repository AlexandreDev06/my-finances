class FutureGoal < ApplicationRecord
  enum priority: [:no_need, :need, :urgent]
  belongs_to :user

  def self.total_goals current_user
    totaln = 0
    current_user.future_goals.all.sum { |f| totaln += f.total }
    totaln
  end
end
