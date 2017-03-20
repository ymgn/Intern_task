class User < ApplicationRecord
  has_many :user_skills
  has_many :reactions
end
