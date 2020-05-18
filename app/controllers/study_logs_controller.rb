class StudyLogsController < ApplicationController
  before_action :authenticate_user!
  def create
    question = current_user.questions.find(params[:question_id])
    log = question.study_logs.build(correctness: params[:correctness])
    log.save
  end
end
