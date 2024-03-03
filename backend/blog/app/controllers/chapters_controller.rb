class ChaptersController < ApplicationController
  before_action :set_context
  def index
    @event = Event.find_by(id: params[:event_id])
    @chapters = @event.chapters
    @chapters.map { |e| e.as_json }
    render json: {metadata: @metadata, chapters: @chapters}
  end

  private

  def set_context
    @user = User.find_by(handle: params[:handle])
    @metadata = {for_current_user: for_current_user(user_id: @user.id)}
  end
end
