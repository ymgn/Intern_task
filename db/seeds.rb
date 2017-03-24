# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# userを作成
(1..20).each do |i|
  user = User.new
  user.name = "ユーザー#{i}"
  user.email = "user#{i}@example.com"
  user.introduction = "ユーザー#{i}です"
  user.password = "123456"
  user.save!
end

# スキルを作成
Skill.create(name: "Ruby")
Skill.create(name: "PHP")
Skill.create(name: "Python")
Skill.create(name: "Javascript")
Skill.create(name: "Golang")

# ユーザーにスキルを紐付ける
UserSkill.create(user_id: 1,skill_id: 1)
UserSkill.create(user_id: 1,skill_id: 2)
UserSkill.create(user_id: 1,skill_id: 3)
UserSkill.create(user_id: 2,skill_id: 4)
UserSkill.create(user_id: 2,skill_id: 5)
UserSkill.create(user_id: 3,skill_id: 1)
UserSkill.create(user_id: 3,skill_id: 2)
UserSkill.create(user_id: 3,skill_id: 3)
UserSkill.create(user_id: 3,skill_id: 4)
UserSkill.create(user_id: 4,skill_id: 5)

# リアクションをつける
Reaction.create(user_skill_id: 1,user_id: 5)
Reaction.create(user_skill_id: 1,user_id: 6)
Reaction.create(user_skill_id: 1,user_id: 7)
Reaction.create(user_skill_id: 1,user_id: 8)
Reaction.create(user_skill_id: 1,user_id: 9)
Reaction.create(user_skill_id: 1,user_id: 10)
Reaction.create(user_skill_id: 2,user_id: 5)
Reaction.create(user_skill_id: 2,user_id: 6)
Reaction.create(user_skill_id: 4,user_id: 5)
Reaction.create(user_skill_id: 6,user_id: 5)
Reaction.create(user_skill_id: 6,user_id: 6)
Reaction.create(user_skill_id: 7,user_id: 7)
Reaction.create(user_skill_id: 7,user_id: 8)