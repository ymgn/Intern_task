class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :reactions
  validates :user,presence: true
  validates :skill,presence: true
end
