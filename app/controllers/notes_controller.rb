class NotesController < ApplicationController
  def index
    @notes = Note.all
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    @note.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_back(fallback_location: root_path)
  end

  def edit
    render :edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(notes_params)
    redirect_to root_path
  end

  private
  def notes_params
    params.require(:note).permit(:title, :description)
  end
end
