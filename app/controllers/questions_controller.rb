class QuestionsController < ApplicationController
  before_action :set_question, only: :show
  before_action :set_user_question, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all.page(params[:page]).per(10)
  end

  def show
    @answers = @question.answers
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path(page: params[:page])
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_user_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :author)
  end

end
