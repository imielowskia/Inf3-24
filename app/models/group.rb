class Group < ApplicationRecord
  has_many :students
  belongs_to :field
  has_and_belongs_to_many :courses
end
