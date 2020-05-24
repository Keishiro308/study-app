class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, only: [:completed]
  before_action :schedule_already_exists?, only: [:new]
  before_action -> {
    set_class(:schedule)
  }

  def index
    @schedules = current_user.schedules.where(date: Date.today).order(:priority)
    @completed_schedules = current_user.schedules.where(date: Date.today, completed: true).order(:priority)
    @tomorrow = Date.today + 1.day
    @tomorrow_schedules = current_user.schedules.where(date: @tomorrow)
  end

  def new
    @schedule = Schedule.new
    @date = params[:date]? Date.parse(params[:date]) : Date.today
  end

  def create
    if Schedule.new_shedule(schedule_params, current_user)
      flash.notice = '予定を作成しました'
      redirect_to schedules_path
    else
      flash.alert = '予定を作成できませんでした'
      render 'new'
    end
  end

  def edit
    @date = params[:date]? params[:date] : Date.today
    @schedules = current_user.schedules.where(date: @date, completed: false).order(:priority)
  end

  def update
    if Schedule.update_schedule(schedule_params, current_user)
      flash.notice = '更新しました'
      redirect_to schedules_path
    else
      flash.alert = '更新できませんでした'
      render 'edit'
    end
  end

  def completed
     @schedule = current_user.schedules.find(params[:id])
     params[:schedule][:completed] = true
     @schedule.update(schedule_params)
     flash.now.notice = '完了しました'
  end

  private
  def schedule_params
    params.require(:schedule).permit(
      :date, 
      :actual_time,
      :review,
      :completed,
      schedule:{ 
        schedule_1:[:priority, :body, :predicted_time], schedule_2:[:priority, :body, :predicted_time], 
        schedule_3:[:priority, :body, :predicted_time], schedule_4:[:priority, :body, :predicted_time],
        schedule_5:[:priority, :body, :predicted_time], schedule_6:[:priority, :body, :predicted_time], 
        schedule_7:[:priority, :body, :predicted_time] 
      }
    )
  end

  def correct_user?
    @schedule = Schedule.find(params[:id])
    unless @schedule.user == current_user
      flash.alert = '権限がありません'
      redirect_to root_path
    end
  end

  def schedule_already_exists?
    date = params[:date]? Date.parse(params[:date]) : Date.today
    if current_user.schedules.where(date: date).any?
      flash.alert = 'スケジュールはすでに登録されています。追加、変更は「編集」から行なってください'
      redirect_to schedules_path
    end
  end
end
