class Group < ApplicationRecord
  has_many :students
  belongs_to :field
end
