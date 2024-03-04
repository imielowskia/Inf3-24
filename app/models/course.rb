class Course < ApplicationRecord
  belongs_to :field
  has_and_belongs_to_many :groups
end
