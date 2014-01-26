class StoredCalendarEvents
  attr_accessor :storage

  def initialize(storage = 'production.yml')
    self.storage = storage
  end

  def <<(new_events)
    update_client do
      Array(new_events).each do |event|
        events << {
          id: event.id,
          start_time: event.start_time,
          end_time: event.end_time
        }
      end
    end
  end

  def current
    delete_old_events

    events.sort_by do |event|
      event[:start_time]
    end.first

  end

  def delete_old_events
    update_client do
      events.reject! do |event|
        event[:end_time] < Time.now
      end
    end
  end

  def events
    client[:events]
  end

  private

  def client
    @client ||= YAML::load_file(file) || { events: [] }
  end

  def update_client(&block)
    yield
    client[:events].uniq!
    File.open(file, 'w+') { |f| f.write(client.to_yaml) }
  end

  def file
    @file ||= File.join('.', 'db', storage)
  end

end
