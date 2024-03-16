class Student < ApplicationRecord
  validates :indeks, format: { with: /\A\d{6}\z/, message: "tylko 6 cyfr"}

  belongs_to :group
  has_many :grades
  has_many :courses, through: :grades
end
