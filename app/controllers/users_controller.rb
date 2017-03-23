class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @skills = User.find(params[:id]).skill
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = "ユーザーを作成しました"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ユーザー管理用ページ
  def list
    @users = User.all
  end

  # ユーザーにスキルを追加
  def add_skill
    user = User.find(params[:user_id])
    # 既に同じスキルがスキルテーブルにあればIDをとってくる
    if(Skill.has_skill(params[:skill]))
      # スキルがあった場合
      skill_id = Skill.find_by(name: params[:skill]).id
    else
      # スキルが無い場合スキルテーブルに追加
      objSkill = Skill.create(name: params[:skill])
      skill_id = objSkill.id
    end
    
    # ユーザーが同じスキルを持っていた場合
    if (user.skill.exists?(id: skill_id))
      # ユーザーが持っているスキル
      flash[:danger] = "既にあるスキルです"
      redirect_to :action => "show", :id => params[:user_id]
    else
      # ユーザーがまだ持っていないスキル
      @user_skill = UserSkill.create(user_id: params[:user_id], skill_id: skill_id)
      flash[:success] = "スキルを追加しました"
      redirect_to :action => "show", :id => params[:user_id]
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :introduction, :password, :password_confirmation)
    end
end
