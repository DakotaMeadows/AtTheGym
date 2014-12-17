class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercise_path(@exercise)
    else
      redirect_to new_exercise_path
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    @exercise.update_attibutes(post_params)
    redirect_to exercise_path(@exercise)
  end

  def destroy
    Exercise.find(params[:id]).destroy
    redirect_to exercises_path
  end

  private

    def exercise_params
      params.require(:exercise).permit(:name, :description)
    end

end
