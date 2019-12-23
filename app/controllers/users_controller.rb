class UsersController < ApplicationController

  before_action :confirm_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
    if @user.update(user_params)
      redirect_to action: 'show', notice:"プロフィールを編集しました"
    else
      render :edit
    end
  end

  # 飯田さん始
  def favo_index
    @user = User.where(id: current_user.id)
    @favorites = Favorite.where(user_id: current_user)
  end
  # 飯田さん終

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,
                                   :image, :introduce)
    end

    def confirm_user
      @user = User.find(params[:id])
      unless current_user.id == @user.id
        flash[:notice] = "本人以外の編集は出来ません。"
        redirect_to feeds_path
      end
    end

end
