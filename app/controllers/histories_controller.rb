class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action -> {
    set_class(:history)
  }
  def index
    #グラフ用の変数
    today = DateTime.current
    this_week = (today.days_ago(6)..today)
    this_month = (today.beginning_of_month..today)
    this_year = (today.beginning_of_year..today.end_of_year)
    count_by_day_week = StudyLog.term_count_by('day', this_week, current_user)
    count_by_day_month = StudyLog.term_count_by('day', this_month, current_user)
    count_by_month_year = StudyLog.term_count_by('month', this_month, current_user)
    gon.count_by_day_week = count_by_day_week
    gon.count_by_day_month = count_by_day_month
    gon.count_by_month_year = count_by_month_year
    gon.this_week = this_week.map{ |day| day.strftime("%m月%d日")}
    gon.this_month = this_month.map{ |day| day.strftime("%m月%d日")}
    gon.this_year = (1..12).map{ |month| month.to_s + "月"}

    #ビュー用変数
    @today_logs = current_user.study_logs.where(created_at: today.beginning_of_day..today)
  end

end
