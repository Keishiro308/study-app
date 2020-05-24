class Schedule < ApplicationRecord
  belongs_to :user

  def self.new_shedule(schedule_params, current_user)
    self.transaction do
      schedule_params[:schedule].each do |k, params|
        unless params.values.any? &:empty?
          params[:date] = schedule_params[:date]
          params[:user_id] = current_user.id
          self.new(params).save!
        end
      end
    end
  end

  def self.update_schedule(schedule_params, current_user)
    schedules = current_user.schedules.where(date: schedule_params[:date], completed: false)
    self.transaction do
      schedules.each do |schedule|
        schedule.destroy!
      end
      schedule_params[:schedule].each do |k, params|
        unless params.values.any? &:empty?
          params[:date] = schedule_params[:date]
          params[:user_id] = current_user.id
          self.new(params).save!
        end
      end
    end
  end
end
