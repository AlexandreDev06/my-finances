class Credit < ApplicationRecord
  enum flux: [:balance, :saving]
  belongs_to :user
end
