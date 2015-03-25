class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
    @answers = Answer.new
    @answer_list = Answer.where(question_id: params[:id])
    @user = current_user
  end

  def new
    @questions = Question.new
  end

  def create
    user_id = current_user.id
    title = params["question"]["title"]
    body = params["question"]["body"]
    question = Question.new(user_id: user_id, title: title, body: body)
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
    question = Question.where(id: params[:id])
    user_id = current_user.id
    owner_id = question.first.user_id
    title = params["question"]["title"]
    body = params["question"]["body"]
    questions = Question.find(params[:id])
    if user_id == owner_id
      if questions.update_attributes(user_id: 1, title: title, body: body)
        flash[:notice] = ["Question updated."]
        redirect_to "/questions/#{params[:id]}"
      else
        binding.pry
        flash[:notice] = questions.errors.full_messages
        redirect_to "/questions/#{params[:id]}/edit"
      end
    else
      flash[:notice] = ["Only the creator is allowed to edit this post."]
      redirect_to "/questions/#{params[:id]}"
    end
  end

  def destroy
    question = Question.where(id: params[:id])
    user_id = current_user.id
    owner_id = question.first.user_id
    if user_id == owner_id
    question.destroy_all
    Answer.where(question_id: params[:id]).destroy_all
    flash[:notice] = ["Question deleted."]
    redirect_to "/questions"
    else
      flash[:notice] = ["Only the creator is allowed to delete this post."]
      redirect_to "/questions/#{params[:id]}"
    end
  end

end
