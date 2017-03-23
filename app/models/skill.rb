class Skill < ApplicationRecord
  has_many :user_skills
  has_many :user, through: :user_skills

  def self.has_skill(name)
    skill = Skill.find_by(name: name)
    if skill.nil?
      return false
    else
      return true
    end
  end
end
