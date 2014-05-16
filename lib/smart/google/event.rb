class Google::Event
  def now?
    start_time < Time.now && Time.now < end_time
  end

  def hangout_link
    content.match(Smart::HANGOUT_REGEX).to_s
  end

  def hangout_link?
    !!content.match(Smart::HANGOUT_REGEX)
  end

  def start_time
    @start_time ||= Time.now.utc
    @start_time.is_a?(String) ? Time.parse(@start_time) : @start_time.xmlschema
  end

  def end_time
    @end_time ||= Time.now.utc + (60 * 60) # seconds * min
    @end_time.is_a?(String) ? Time.parse(@end_time) : @end_time.xmlschema
  end
end
