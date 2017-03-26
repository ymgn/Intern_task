class User < ApplicationRecord
  has_many :user_skills
  has_many :skill, through: :user_skills
  has_many :reactions
  
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ユーザーが持っているスキルとそれについているリアクションユーザーを返す
  def skills_reaction
    # ユーザーの所持してるスキル一覧
    user_skills = self.user_skills
    # スキル名とリアクション情報を格納
    skills_reactions = []
    # ユーザーが持っているスキルの回数回す
    user_skills.each do |u_s|
      # データ格納用ハッシュ
      item = {}
      item["name"] = Skill.find(u_s.skill_id).name
      item["skill_id"] = u_s.skill_id
      # リアクションがついているか
      if !u_s.reactions.empty? 
        reaction_users = [] # リアクションをしたユーザーのリスト用
        r_users = {}  # リアクションしたユーザーの情報格納用ハッシュ
        # スキルに対してリアクションをつけたユーザーの数,回す
        u_s.reactions.each do |r|
          r_users["name"] = User.find(r.user_id).name
          r_users["id"] = r.user_id
          reaction_users.push(r_users.dup)
        end
        item["reaction_users"] = reaction_users
        item["count"] = u_s.reactions.length
      else
        # リアクションがついていない場合
        item["count"] = 0
      end
      skills_reactions.append(item)
    end
    # 並び替え
    result = skills_reactions.sort_by{|val|-val["count"]}
    return result
  end
end
