class PostsController < ApplicationController#
  http_basic_authenticate_with name: "me", password: "pass", only: :destroy

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_path(@user), status: :see_other
  end

private

  def post_params
    params.expect(post: [ :body, :status ])
  end
end
