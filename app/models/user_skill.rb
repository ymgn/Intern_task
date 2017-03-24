class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :reactions, :dependent => :destroy
  validates :user,presence: true
  validates :skill,presence: true
end
