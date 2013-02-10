class CalendarController < ApplicationController

  def index
    @first_day_of_week = 1
    @month = (params[:month] || Time.zone.now.month).to_i
    @year = (params[:year] || Time.zone.now.year).to_i

    @shown_month = Date.civil(@year, @month)
    @event_startDate = Event.first.start_at

#    @event_strips = Event.event_strips_for_month(@shown_month)
    @event_strips = Event.event_strips_for_month(@event_startDate)

    # To restrict what events are included in the result you can pass additional find options like this:
    #
    # @event_strips = Event.event_strips_for_month(@shown_month, :include => :some_relation, :conditions => 'some_relations.some_column = true')
    #

  end

end

