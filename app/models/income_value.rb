class IncomeValue < ApplicationRecord
  enum title: [:salary, :other]
end
