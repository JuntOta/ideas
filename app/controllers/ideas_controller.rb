class IdeasController < ApplicationController

  def index
    @category_ideas = CategoryIdea.all
    render json: @category_ideas
  end

  def show
    @category_idea = CategoryIdea.find(params[:id])
    render json: @category_idea
  end

  # def new
  #   @category_idea = CategoryIdea.new
  # end

  def create
    @category_idea = CategoryIdea.new(category_params)
    @category_idea.valid?
    if @category_idea.save
      render json: @category_idea, status: :created, location: @category_idea
    else
      render json: @category_idea.errors, status: 422
    end
  end

  private

    def category_params
      params.require(:category_idea).permit(:name)
    end

    # def idea_params
    #   params.require(:category_idea).permit(:body).merge(category_id: @category.id)
    # end
end
