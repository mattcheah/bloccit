class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new
    
    @question.title = params[:question][:title]
    @question.body =  params[:question][:body]
    @question.resolved = false
    
    if @question.save
      flash[:notice] = "Question was saved successfully"
      redirect_to @question
    else
      flash.now[:alert] = "Question was unable to be saved. Please Try Again"
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update 
    @question = Question.find(params[:id])
    
    @question.title = params[:question][:title]
    @question.body =  params[:question][:body]
    @question.resolved = params[:question][:resolved]
    
    if @question.save
      flash[:notice] = "Question was edited successfully"
      redirect_to @question
    else
      flash.now[:alert] = "Question was unable to be edited. Please Try Again"
      render :new
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
      flash[:notice] = "Question successfully deleted"
      redirect_to questions_path
    else
      flash.now[:alert] = "Delete operation unsuccessful, please try again."
      render @question
    end
  end
  
end
