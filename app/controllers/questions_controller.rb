class QuestionsController < ApplicationController

  def index
    @questions = Question.all

  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Succes!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: 'Update Succes!'
    else
      flash[:alert] = "Update Save error!"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: 'Delete Succes!'
  end

  private

  def question_params
    params.require(:question).permit(:name, :title, :content)
  end

end
