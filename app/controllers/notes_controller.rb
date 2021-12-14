class NotesController < ApplicationController
  def index
    @notes = Note.all
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    @note.save
  end

  private
  def notes_params
    params.require(:note).permit(:title, :description)
  end
end
