class User < ApplicationRecord
  has_many :user_skills
  has_many :skill, through: :user_skills
  has_many :reactions
end
