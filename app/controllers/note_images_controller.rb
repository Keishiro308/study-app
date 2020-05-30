class NoteImagesController < ApplicationController
  require 'mini_magick'
  before_action :authenticate_user!
  def create
    @note_image = NoteImage.new(note_image_params)
    image = params[:note_image][:image]
    mini_image = MiniMagick::Image.new(image.tempfile.path)
    mini_image.resize '700x500>'
    @note_image.save
    respond_to do |format|
      format.json  { render :json => { url: url_for(@note_image.image), id: @note_image.id } }
    end
  end

  def destroy
    @note_image = NoteImage.find(params[:id])
    @note_image.destroy
    respond_to do |format|
      format.json { render :json => { status: :ok } }
    end
  end

  private
  def note_image_params
    params.require(:note_image).permit(:image)
  end
end
