class Course < ApplicationRecord
  belongs_to :field
  has_and_belongs_to_many :groups
  has_many :grades
end
