class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      flash.notice = "Note #{@note.title} has been created successfully!"
      redirect_to @note
    else
      flash.alert = @note.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash.notice = "Note #{@note.title} has been deleted successfully!"

    redirect_to root_path
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(notes_params)
      flash.notice = "Note #{@note.title} has been updated successfully!"
      redirect_to @note
    else
      flash.alert = @note.errors.full_messages.to_sentence
      render :edit
    end
  end

  private
  def notes_params
    params.require(:note).permit(:title, :description)
  end
end
