class ApplicationController < ActionController::Base
  private
  def set_class(key)
    @active_hash = {
      home: '',
      history: '',
      question: '',
      schedule: '',
      note: '',
      other: ''
    }
    @active_hash[key] = 'uk-active'
  end
end
