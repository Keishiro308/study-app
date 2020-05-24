class Question < ApplicationRecord
  has_many_attached :question_images
  has_many_attached :answer_images
  has_many :question_and_tags, dependent: :destroy
  has_many :tags, through: :question_and_tags
  has_many :study_logs, dependent: :destroy
  belongs_to :user

  validates :user_id, :use, presence: true
  
  

  def self.select_questions(params, current_user)
    if params[:random].to_i == 1 #paramsは文字列で来ているから数値に変換
      questions = current_user.questions.sample(params[:number].to_i)
    elsif params[:recent_mistake].to_i == 1
      #学習ログから間違った問題を抽出して指定した数だけ抜き出す。
      logs = current_user.study_logs.order(created_at: :desc).where(correctness: -1).sample(params[:number].to_i)
      questions = logs.map{|log| log.question}
    else
      qs = []
      params[:question][:tag_ids].delete_at(0) #最初に空文字が入っているから最初の要素を削除
      #選択されたタグの問題を集めてそこからランダムに指定された数だけ取り出す。
      tags = current_user.tags.where(id: params[:question][:tag_ids])
      tags.each do |tag|
        qs += tag.questions
      end
      questions = qs.sample(params[:number].to_i)
    end
    questions
  end

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    deleted_tags = current_tags - tags
    added_tags = tags - current_tags

    deleted_tags.each do |tag|
      self.tags.delete Tag.find_by(name: tag)
    end

    added_tags.each do |tag|
      new_tag = Tag.find_or_create_by(name: tag)
      self.tags << new_tag
    end
  end
end
