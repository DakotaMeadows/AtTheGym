class Exercise < ActiveRecord::Base
  has_many :reps
  has_many :exercises, through: :reps

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
