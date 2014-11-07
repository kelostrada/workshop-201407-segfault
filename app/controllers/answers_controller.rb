class AnswersController < ApplicationController
  before_action :set_question

  def create
    @answer = current_user.answers.new(answer_params) do |answer|
      answer.question = @question
    end

    if @answer.save
      redirect_to @question
    else
      @answers = @question.answers

      render 'questions/show'
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])

    @answer.destroy

    redirect_to @question
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end
