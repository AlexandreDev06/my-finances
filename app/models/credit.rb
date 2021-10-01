class Credit < ApplicationRecord
  belongs_to :user
  enum flux: [:balance, :saving]
end
