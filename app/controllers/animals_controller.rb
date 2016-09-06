class AnimalsController < ApplicationController
  def index
    @animals = Animal.all

    render :index
  end

  def show
    @animal = Animal.find(params[:id])
    @sightings = @animal.sightings
    no_date = params[:date1].blank? || params[:date2].blank?
    no_region = params[:region].blank?
    @sightings = @animal.sightings.searchDate(params[:date1], params[:date2]).searchRegion(params[:region]) unless no_date || no_region
    @sightings = @animal.sightings.searchDate(params[:date1], params[:date2]) unless no_date if no_region
    @sightings = @animal.sightings.searchRegion(params[:region]) unless no_region if no_date
    render :show
  end

  def new
    @animal = Animal.new
    render :new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    render :edit
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animals_path
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end


private
  def animal_params
    params.require(:animal).permit(:name)
  end
end
