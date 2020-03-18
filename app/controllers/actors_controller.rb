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
    @alive = ActiveModel::Type::Boolean.new.cast(params[:actor_alive])
    if @alive == true
      @actor = Actor.new(name: "#{params[:actor_name]}", 
          bio: "#{params[:actor_bio]}", 
          birth_date: "#{params[:actor_birthdate]}",
          birth_place: "#{params[:actor_birthplace]}",
          image_url: "#{params[:actor_image_url]}",
          alive: @alive)
      else
      @actor = Actor.new(name: "#{params[:actor_name]}", 
          bio: "#{params[:actor_bio]}", 
          birth_date: "#{params[:actor_birthdate]}",
          birth_place: "#{params[:actor_birthplace]}",
          image_url: "#{params[:actor_image_url]}",
          alive: @alive,
          death_date: "#{params[:actor_deathdate]}",
          death_place: "#{params[:actor_deathplace]}")      
    end

    if @actor.save
      @actores = Actor.all
      render 'layouts/index'
    else
      @errors = @actor.errors.full_messages
      render 'layouts/new'
    end
    
  end
end
