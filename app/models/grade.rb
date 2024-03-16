class Grade < ApplicationRecord
  validates :grade, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 5 }
  belongs_to :student
  belongs_to :course
end
