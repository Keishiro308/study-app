class ApplicationController < ActionController::Base
  private
  def set_class(key)
    @active_hash = {
      home: '',
      history: '',
      question: '',
      schedule: '',
      other: ''
    }
    @active_hash[key] = 'uk-active'
  end
end
