class AnswersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    user_id = current_user.id
    body = params["answer"]["body"]
    question_id = params["question_id"].to_i
    answer = Answer.new(question_id: question_id, user_id: user_id, body: body)
    if answer.save
      flash[:notice] = ['Answer added.']
      redirect_to "/questions/#{question_id}"
    else
      flash[:notice] = answer.errors.full_messages
      redirect_to "/questions/#{question_id}"
    end
  end

  def show
  @answers = Answer.find(params[:id])
  end

end
