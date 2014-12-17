class ExercisesController < ApplicationController

  def index
    @exercises = exercise.all
  end

  def show
    @exercise = exercise.find(params[:id])
  end

  def new
    @exercise = exercise.new
  end

  def create
    @exercise = exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercise_path(@exercise)
    else
      redirect_to new_exercise_path
    end
  end

  def edit
    @exercise = exercise.find(params[:id])
  end

  def update
    @exercise = exercise.find(params[:id])
    @exercise.update_attibutes(post_params)
    redirect_to exercise_path(@exercise)
  end

  def destroy
    exercise.find(params[:id]).destroy
    redirect_to exercises_path
  end

end
