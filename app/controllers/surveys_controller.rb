class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      redirect_to @survey, notice: "Successfully created survey."
    else
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, notice: "Successfully updated survey."
    else
      render :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, notice: "Successfully destroyed survey."
  end

  def add
    @answer = Answer.find(params[:id])
    @answer.add
    @question = Question.where(:id => @answer.question_id).first
    @counter = 0
    @select = 0
    @div = "#question_" + @question.id.to_s
    #respond_with(@comment)
    respond_to do |format|
      format.js   {}
      format.json { render json: @answer, status: :created, location: @answer }
    end
  end

end
