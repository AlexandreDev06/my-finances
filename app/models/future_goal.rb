class FutureGoal < ApplicationRecord
  enum priority: [:no_need, :need, :urgent]

  def self.total_goals
    totaln = 0
    FutureGoal.all.sum { |f| totaln += f.total }
    totaln
  end
end
