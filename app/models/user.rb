class User < ApplicationRecord
  has_many :expense
  has_many :credit
end
