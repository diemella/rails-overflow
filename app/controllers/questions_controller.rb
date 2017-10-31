class QuestionsController < ApplicationController

  def index # get '/questions'
    @questions = Question.all
  end

  def show # get '/questions/:id'
    @question = Question.find(params[:id])
  end

  def new # get '/questions/new'
    @question = Question.new # rails knows to look in views/questions for new.html.erb
  end

  def edit # get '/questions/:id/edit'
    @question = Question.find(params[:id])
  end

  def create # post '/questions'
    @question = Question.new(question: params[:question][:question], user_id: session[:user_id])

    if @question.save
      redirect_to question_path(@question) # redirect "/questions/#{@question.id}"
    else
      render 'new' # erb :'/questions/new'
    end
  end

  def update # put '/questions/:id'
    @question = Question.find(params[:id])

    if @question.update(question: params[:question][:question], user_id: session[:user_id])
      redirect_to question_path(@question) # redirect "/questions/#{@question.id}"
    else
      render 'edit' # erb :'/questions/edit'
    end
  end

  def destroy # delete '/questions/:id'
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path # redirect '/questions'
  end

private
  def question_params # 'strong parameters' with require and permit for security reasons

  end

end
