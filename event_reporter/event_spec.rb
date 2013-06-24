require_relative 'event'
require_relative 'queue_processor'
require 'rspec/autorun'

describe "Reporting an", Event do
  before do
    @event_name = 'Bday Party'
    @event = Event.new(@event_name)
  end

  context "a new event" do
    it "has a name" do
      expect(@event.name).to eql(@event_name)
    end

    it "doesn't have a list of attendees" do
      expect(@event.attendees).to eq([])
    end

    it "has a queue processor" do
      expect(@event.event_queue.class).to eql(QueueProcessor)
    end
  end
end