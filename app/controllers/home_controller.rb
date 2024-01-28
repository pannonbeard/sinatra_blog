# frozen_string_literal: true

# Controller For Home
class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
end
