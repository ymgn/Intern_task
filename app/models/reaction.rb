class Reaction < ApplicationRecord
  belongs_to :user_skill
  belongs_to :user
  validates :user,presence: true
  validates :user_skill,presence: true
end
