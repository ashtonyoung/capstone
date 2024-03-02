class EventsController < ApplicationController
  before_action :set_context
  def index
    @events = @user.events
    @events.map { |e| e.as_json }
    render json: {metadata: @metadata, events: @events}
  end

  private

  def set_context
    @user = User.find_by(handle: params[:handle])
    @metadata = {for_current_user: for_current_user(user_id: @user.id)}
  end
end
