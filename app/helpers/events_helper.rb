module EventsHelper
  def pretty_date value
    if value
      value.strftime("%d-%B-%Y")
    else
      'Unknown'
    end
  end
end
