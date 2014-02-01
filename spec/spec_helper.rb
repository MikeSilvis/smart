require 'rubygems'
require 'bundler/setup'
require 'debugger'
require 'smart'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :faraday
end

RSpec.configure do |config|

  config.before do
    Smart::StoredCalendarEvents.any_instance.stub(:storage).and_return('test.yml')
    File.open(Smart::StoredCalendarEvents.new.send(:file), 'w') {|file| file.truncate(0) }
  end

end
