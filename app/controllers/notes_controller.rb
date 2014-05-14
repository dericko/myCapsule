class NotesController < ApplicationController

  def index
    if user_signed_in?
      @notes = Note.all
    else
      redirect_to new_user_session_path
    end
  end

  def new
    if user_signed_in?
      @note = Note.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @note = Note.new(note_params)
    if @note.user_id != current_user.id
      redirect_to root_path
    else
      if @note.save
        Notifications.new_note(@note).deliver
        redirect_to notes_path
      else
        render 'new'
      end
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.user_id != current_user.id
      render 'edit'
    else
      if @note.update_attributes(note_params)
        redirect_to notes_path(@note_id)
      else
        render 'edit'
      end
    end
  end

  def show
    @note = Note.find(params[:id])
    @ellapsed = Time.now - @note.created_at
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
  	params.require(:note).permit(:title, :body, :timer, :maketime, :user_id)
  end

end