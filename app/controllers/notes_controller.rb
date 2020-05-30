class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action -> {
    set_class(:note)
  }
  before_action :correct_user?, only: [:show, :edit, :update, :destroy]
  before_action :set_tag_white_list, only: [:index, :show]

  def index
    @notes = current_user.notes.includes(:tags).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @note = current_user.notes.find(params[:id])
  end

  def new
    @note = Note.new
    @tag_string = ''
  end

  def create
    tag_list = note_params[:tag_names].split(',')
    params[:note].delete(:tag_names)
    params[:note][:user_id] = current_user.id
    @note = Note.new(note_params)
    if @note.save
      @note.save_tags(tag_list)
      flash.notice = 'ノートを作成しました'
      redirect_to notes_path
    else
      flash.now.alert = 'ノートを作成できませんでした'
      render 'new'
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
    @tag_string = @note.tags.pluck(:name).join(',')
  end

  def update
    @note = current_user.notes.find(params[:id])
    tag_list = note_params[:tag_names].split(',')
    params[:note].delete(:tag_names)
    params[:note][:user_id] = current_user.id
    if @note.update(note_params)
      @note.save_tags(tag_list)
      flash.notice = 'ノートを更新しました'
      redirect_to note_path(@note)
    else
      flash.now.alert = 'ノートを更新できませんでした'
      render 'edit'
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    if @note.destroy
      flash.notice = 'ノートを削除しました。'
    else
      flash.alert = 'ノートを削除できませんでした。'
    end
    redirect_to notes_path
  end

  private
  def note_params
    params.require(:note).permit(:title, :body, :tag_names, :user_id)
  end

  def correct_user?
    user = Note.find(params[:id]).user
    unless user == current_user
      flash.alert = '権限がありません'
      redirect_to root_path
    end
  end

  def set_tag_white_list
    @tags_white_list = %w(a acronym b strong i em li ul ol h1 h2 h3 h4 h5 h6 blockquote br cite sub sup ins p img iframe)
  end
end
