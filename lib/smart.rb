require 'google_calendar'
require 'yaml'
require 'smart/version'
require 'smart/google/event'
require 'smart/stored_calendar_events'
require 'smart/puller'
require 'smart/action'
require 'smart/process'

module Smart
  HANGOUT_REGEX = /^https:\/\/plus.google.com\/hangouts\/_\//
end
