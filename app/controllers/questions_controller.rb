class QuestionsController < ApplicationController
  require 'mini_magick'

  before_action :correct_user?, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action -> {
    set_class(:question)
  }

  def index
    @questions = current_user.questions.includes(:tags).order(created_at: :desc)
  end

  def new
    @question = Question.new
    @tag_string = ''
  end

  def create
    tag_list = question_params[:tag_names].split(',')
    params[:question].delete(:tag_names)
    params[:question][:user_id] = current_user.id
    params[:question][:question_images].each do |image|
      mini_image = MiniMagick::Image.new(image.tempfile.path)
      mini_image.resize '700x500>'
    end
    params[:question][:answer_images].each do |answer_image|
      answer_image = MiniMagick::Image.new(answer_image.tempfile.path)
      answer_image.resize '700x500>'
    end
    @question = Question.new(question_params)
    if @question.save
      @question.save_tags(tag_list)
      flash.notice = '問題を登録しました'
      redirect_to questions_path
    else
      flash.now.alert = '問題を登録できませんでした'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @tag_string = @question.tags.pluck(:name).join(',')
  end

  def update
    @question = Question.find(params[:id])
    tag_list = question_params[:tag_names].split(',')
    params[:question].delete(:tag_names)
    params[:question][:user_id] = current_user.id
    if @question.update(question_params)
      @question.save_tags(tag_list)
      flash.notice = '問題を更新しました'
      redirect_to questions_path
    else
      flash.now.alert = '問題を更新できませんでした'
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash.notice = '削除できました。'
    else
      flash.alert = '削除できませんでした。'
    end
    redirect_to questions_path
  end

  def select
    @tags = current_user.tags.distinct
    @numbers = (1..10).map{ |n| n * 10 }
  end

  def practice
    @questions = Question.select_questions(params, current_user)
  end

  def random
    @questions = current_user.questions.sample(20)
  end
  
  private
  def question_params
    params.require(:question).permit(:question, :answer, :user_id, :use, :tag_names, question_images: [], answer_images: [])
  end

  def correct_user?
    @question = Question.find(params[:id])
    if @question.user != current_user
      flash.alert = '権限がありません。'
      redirect_to root_path
    end
  end
end
