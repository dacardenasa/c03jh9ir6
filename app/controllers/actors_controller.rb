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
    @alive = ActiveModel::Type::Boolean.new.cast(params[:alive])
    if @alive == true
      @actor = Actor.new(name: "#{params[:name]}", 
          bio: "#{params[:bio]}", 
          birth_date: "#{params[:birthdate]}",
          birth_place: "#{params[:birthplace]}",
          image_url: "#{params[:image_url]}",
          alive: @alive)
      else
      @actor = Actor.new(name: "#{params[:name]}", 
          bio: "#{params[:bio]}", 
          birth_date: "#{params[:birthdate]}",
          birth_place: "#{params[:birthplace]}",
          image_url: "#{params[:image_url]}",
          alive: @alive,
          death_date: "#{params[:deathdate]}",
          death_place: "#{params[:deathplace]}")      
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
