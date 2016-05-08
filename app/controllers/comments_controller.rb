class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
