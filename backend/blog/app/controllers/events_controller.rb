class EventsController < ApplicationController
  def index
    @user = User.find_by(handle: params[:handle])
    if @user.blank?
      render json: {error: "User not found"}, status: :not_found
      return
    end
    @metadata = {for_current_user: for_current_user(user_id: @user.id)}

    @events = @user.events.order(start_date: :desc)
    @events.map { |e| e.as_json }
    render json: {metadata: @metadata, events: @events}
  end

  def create
    @event = Event.new(user_id: current_user.id, **event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    render json: @event.as_json(include_nil_values: true)
  end

  private

  def event_params
    params.require(:event).permit(
      %i[
        name
        description
        start_date
      ]
    )
  end
end
