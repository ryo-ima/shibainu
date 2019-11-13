class VariablecostValue < ApplicationRecord
  enum title: [:consumption, :waste, :investment]
end
