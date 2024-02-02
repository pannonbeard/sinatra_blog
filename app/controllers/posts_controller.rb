# frozen_string_literal: true

# Controller For Posts
class PostsController < ApplicationController
  before do
    authorize
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.first(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(params[:post])

    redirect '/posts'
  end

  def edit
    @post = Post.first(id: params[:id])
  end

  def update
    @post = Post.first(id: params[:id])
    @post.update(params[:post])

    redirect "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.first(id: params[:id])
    @post.destroy

    redirect '/posts'
  end

  private

  def authorize
    if !current_user
      redirect 'sessions/users/sign_in'

      return
    end
  end
end
