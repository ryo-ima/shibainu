class IncomeValue < ApplicationRecord
  enum title: [:salary, :other]
  belongs_to :user
end
