class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      redirect_to workouts_path
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    Workout.find(params[:id]).update_attibutes(workout_params)
    redirect_to workout_path
  end

  def destroy
    Workout.find(params[:id]).destroy
    redirect_to workouts_path
  end

  private
    def workout_params
      params.require(:workout).permit(:name, :description)
    end

end
