require 'spec_helper'

describe Puller do
  subject { Puller.new }

  describe '.run' do

    it 'saves calendar events' do
      VCR.use_cassette('todays_events') do
        expect { subject.run }.to change { StoredCalendarEvents.new.events.size }.by(1)
      end
    end

  end

end
