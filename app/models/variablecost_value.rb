class VariablecostValue < ApplicationRecord
  enum title: [:consumption, :waste, :investment]
  belongs_to :user
end
