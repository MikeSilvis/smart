class Puller
  attr_accessor :username, :password

  def initialize
    self.username = ENV['USER']
    self.password = ENV['PASSWORD']
  end

  def run
    StoredCalendarEvents.new << todays_events
  end

  #def open_hangout
    #if current_event
      #`open #{current_event.hangout_link}`
      #schedule_hangout_close
    #end
  #end

  #def schedule_hangout_close
    #`echo "(pgrep Chrome | xargs kill)" | at #{current_event.end_time.strftime("%H:%M")}`
  #end

  private

  def todays_events
    @todays_events ||= Array(client.find_events_in_range(
      Time.parse("#{current_day} 00:00"),
      Time.parse("#{current_day} 23:59"),
      order_by: 'starttime'
    )).select do |event|
      event.hangout_link?
    end
  end

  def client
    @client ||= Google::Calendar.new(username: username, password: password)
  end

  def current_day
    Time.now.strftime('%Y-%m-%d')
  end

end
