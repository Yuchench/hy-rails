class Admin::EventsController < ApplicationController
  layout 'admin'
  http_basic_authenticate_with :name => "test", :password => "test"
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @page_title = "最新活動"
    @events = Event.all
  end

  def show
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_url, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /fireworks/new
  def new
    @event = Event.new
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url }
      format.json { head :no_content }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:name, :content,:url,:event_date)
  end
end
