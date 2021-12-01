class FutureGoal < ApplicationRecord
  enum priority: [:no_need, :need, :urgent]
  belongs_to :user

  def self.total_goals
    totaln = 0
    FutureGoal.all.sum { |f| totaln += f.total }
    totaln
  end
end
