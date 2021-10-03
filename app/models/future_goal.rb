class FutureGoal < ApplicationRecord
  enum priority: [:no_need, :need, :urgent]
end
