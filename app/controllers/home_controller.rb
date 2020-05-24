class HomeController < ApplicationController
  before_action -> {
    set_class(:home)
  }
  def top
    today = DateTime.current
    if user_signed_in?
      @schedules = current_user.schedules.where(date: Date.today).order(:priority)
      @today_logs = current_user.study_logs.where(created_at: today.beginning_of_day..today)
      @tomorrow = Date.today + 1.day
    end
  end
end
