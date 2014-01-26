class Puller
  attr_accessor :username, :password

  def initialize
    self.username = ENV['USER']
    self.password = ENV['PASSWORD']
  end

  def open_hangout
    if current_event
      debugger
      `open #{current_event.hangout_link}`
      schedule_hangout_close
    end
  end

  def schedule_hangout_close
    `echo "(pgrep Chrome | xargs kill)" | at #{current_event.end_time.strftime("%H:%M")}`
  end

  def current_event
    @curren_event ||= todays_events.detect do |event|
                        event.now? && event.hangout_link?
                      end
  end

  private

  def todays_events
    @todays_events ||= client.find_events_in_range(
      Time.parse("#{current_day} 00:00"),
      Time.parse("#{current_day} 23:59"),
      order_by: 'starttime'
    )
  end

  def client
    @client ||= Google::Calendar.new(username: username, password: password)
  end

  def current_day
    Time.now.strftime('%Y-%m-%d')
  end

end
