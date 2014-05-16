require 'spec_helper'

describe Smart::Puller do
  subject { Smart::Puller.new }

  describe '.run' do
    it 'saves calendar events' do
      VCR.use_cassette('todays_events') do
        expect { subject.run }.to change { Smart::StoredCalendarEvents.new.events.size }.by(1)
      end
    end
  end
end
