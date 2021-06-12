class IdeasController < ApplicationController

  def index
    # @category_ideas = CategoryIdea.all
    render json: @idea
  end

  # def show
  #   @category_idea = CategoryIdea.find(params[:id])
  #   render json: @category_idea
  # end

  # def new
  #   @idea = CategoryIdea.new
  # end

  def create
    @category = Category.new(category_params)
    @idea = Idea.new(idea_params)
    @idea.valid?
    if @idea.save
      render json: @idea, status: :created, location: @idea
    else
      render json: @idea.errors, status: 422
    end
  end

  private

    # def category_idea_params
    #   params.require(:category_idea).permit(:name, :body).merge(category_id: @category.id)
    # end

    def category_params
      params.require(:category).permit(:name)
    end

    def idea_params
      params.require(:idea).permit(:body).merge(category_id: @category.id)
    end
end
