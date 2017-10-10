class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    @user = User.find(1) # pass user session id 
    @question = @user.questions.new(question_params)
    @question.save
   
    redirect_to questions_path
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
 
    if @question.update(question_params)
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
 
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
