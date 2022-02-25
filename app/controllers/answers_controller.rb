class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Answer Create Success!'
    else
      redirect_to question_path(@question), alert: 'Answer Create Invalid!'
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Answer Update Success!'
    else
      flash[:alert] = 'Answer Update Invalid!'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: 'Deleted!'


  end

  private

  def answer_params
    params.require(:answer).permit(:content, :name, :question_id)
  end
end
