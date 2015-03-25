class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    body = params["answer"]["body"]
    question_id = params["question_id"].to_i
    answer = Answer.new(question_id: question_id, user_id: 1, body: body)
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
