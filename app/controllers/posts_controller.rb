class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]
  def index
    @posts = Post.order(create_at: :desc)
    @new_posts = Post.order(create_at: :desc).limit(5)
  end
  def new
    @post = Post.new #フォーム用の空インスタンス
  end
  def create
    @post = Post.new(post_params) #ストロングパラメーターを引数に
    # @post.save
    # redirect_to @post, notice:"ブログを登録しました。" #showページにリダイレクト
    if @post.save
      redirect_to @post, notice: "ブログを登録しました。"
    else
      render :new
    end
  end
  def show
    # @post = Post.find(params[:id])
  end
  def edit
    # @post = Post.find(params[:id])
  end
  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "ブログを更新しました。"
    else
      render :edit
    end
  end
def destroy
  # @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path, notice: "ブログを削除しました"
end


  private 

  def post_params #ストロングパラメータ定義
    params.require(:post).permit(:title, :body)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
