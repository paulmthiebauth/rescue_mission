class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
    @answers = Answer.new
    @answer_list = Answer.where(question_id: params[:id])
  end

  def new
    @questions = Question.new
  end

  def create
    title = params["question"]["title"]
    body = params["question"]["body"]
    question = Question.new(user_id: 1, title: title, body: body)
    if question.save
      flash[:notice] = ['Question added.']
      redirect_to "/questions"
    else
      flash[:notice] = question.errors.full_messages
      redirect_to "/questions/new"
    end
  end

  def edit
    @questions = Question.find(params[:id])
  end

  def update
    title = params["question"]["title"]
    body = params["question"]["body"]
    questions = Question.find(params[:id])
    if questions.update_attributes(user_id: 1, title: title, body: body)
      flash[:notice] = ["Question updated."]
      redirect_to "/questions/#{params[:id]}"
    else
      binding.pry
      flash[:notice] = questions.errors.full_messages
      redirect_to "/questions/#{params[:id]}/edit"
    end
  end

  def destroy
    binding.pry
    question_id = params["id"]
    Question.where(id: question_id).destroy_all
    Answer.where(question_id: question_id).destroy_all
    flash[:notice] = ["Question deleted."]
    redirect_to "/questions"
  end

end
