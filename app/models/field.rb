class Field < ApplicationRecord
  has_many :groups
  has_many :courses
end
