class IdeasController < ApplicationController

  def index
    # @category_ideas = CategoryIdea.all
    render json: @idea
  end

  # def show
  #   @category_idea = CategoryIdea.find(params[:id])
  #   render json: @category_idea
  # end

  def new
    @category_idea = CategoryIdea.new
  end

  def create
    @category_idea = CategoryIdea.new(category_idea_params)
    if @category_idea.valid?
      @category_idea.save
      render json: @category_idea, status: :created, location: @category_idea
    else
      render json: @category_idea.errors, status: 422
    end
  end

  private

    def category_idea_params
      params.require(:category_idea).permit(:name, :body).merge(category: @category.id)
    end

    # def category_params
    #   # params.require(:category).permit(:name)
    # end

    # def idea_params
    #   params.require(:idea).permit(:body).merge(category_id: @category.id)
    # end
end
