class Smart::Process

  def current
    events.sort_by do |event|
      event[:start_time]
    end.first
  end

  def old_event
    current[:end_time] < Time.now
  end

  private

  def events
    @events ||= Smart::StoredCalendarEvents.new.events
  end

end
