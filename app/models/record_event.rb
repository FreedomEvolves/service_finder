class RecordEvent
  attr_reader :creator, :params
  attr_reader :event

  def initialize(creator:, params:)
    @creator = creator
    @params = params
    @event = creator.events.build(params)
  end

  def build
    if creator.provider?
      event.provider_confirmed = true
    elsif creator.client?
      event.client_confirmed = true
    end
    return event
  end

  def run!
    build and event.save
  end
end
