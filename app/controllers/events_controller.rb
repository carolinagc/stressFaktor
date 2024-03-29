class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :authorize, :only => [:new, :edit, :create]
  before_filter :admin_required, :only => [:destroy]


  def index
    if params[:search] && !params[:search].empty?
      @events = Event.search(params[:search])
    else
#debugger
      @events = Event.all
    end
    @side_events = Event.where("date=?", Date.today)
    @descriptions = Description.all
#to call gmap4rails you need to use model where latitude and longitud are
#    @json = Event.all.map(&:description).compact.uniq.to_gmaps4rails
    @json = @descriptions.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def calendar
    @events = Event.all
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

  end


  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/calendar
  # GET /events/calendar.json


  def new
    @event = Event.new
    @event.build_description
    @organizers = Organizer.all
    @locations = Location.all
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @organizers = Organizer.all
    @locations = Location.all
    @categories = Category.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
   
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end

   end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
