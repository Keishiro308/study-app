class StudyLog < ApplicationRecord
  belongs_to :question

  def self.term_count_by(unit, term, current_user)
    if unit == 'month'
      log_groups = current_user.study_logs.where(created_at: term).group_by{ |log| log.created_at.month }
      hash = {}
      for i in 1..12 do
        hash[i] = 0
      end
    elsif unit == 'day'
      log_groups = current_user.study_logs.where(created_at: term).group_by{ |log| log.created_at.day }
      hash = {}
      term.each do |date|
        hash[date.day] = 0
      end
    end
    
    log_groups.each do |key, values|
      hash[key] = values.map(&:id).count
    end
    count_by = hash.values
    count_by
  end
end
