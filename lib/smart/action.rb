class Smart::Action
  def open_hangout
    if current = process.current
      `open #{current[:link]}`
    end
  end

  def close_hangout
    if process.old_event
      `pgrep Chrome | xargs kill`
    end
  end

  private

  def process
    @process ||= Smart::Process
  end
end
