class ActorsController < ApplicationController

  def index
    @actores = Actor.all
    render 'layouts/index'
  end

  def new
    @actor = Actor.new
    render 'layouts/new'
  end

  def create
    @actor = Actor.new(actor_params)
    
    if @actor.save
      @actores = Actor.all
      render 'layouts/index'
    else
      @errors = @actor.errors.full_messages
      render 'layouts/new'
    end
    
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :bio, :birth_date, :birth_place, :image_url, :alive, :death_date, :death_place)
  end
  
end
