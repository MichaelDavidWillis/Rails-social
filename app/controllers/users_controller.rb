class UsersController < ApplicationController
  http_basic_authenticate_with name: "me", password: "pass", except: [ :index, :show ]

  def index
    @users = User.all
  end

  def show
    @user = User.includes(image_attachment: :blob).find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, status: :see_other
    else
      render :delete, status: :unprocessable_entity
    end
  end

private
  def user_params
    params.expect(user: [ :first_name, :second_name, :email, :image ])
  end
end
