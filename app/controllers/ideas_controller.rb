class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
  end

  def create
  end
  
  def show
    @idea = Idea.find(params[:id])
  end

  private

    def ideas
end
