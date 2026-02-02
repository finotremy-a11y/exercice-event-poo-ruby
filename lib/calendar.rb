class Calendar
  attr_accessor :events

  def initialize
    @events = []
  end

  def add_event(event)
    @events << event
  end

  def display_events
    @events.each do |event|
      puts event.to_s
      puts "----------------------"
    end
  end

  def sort_events
    @events.sort_by! { |event| event.start_date }
  end

  def display_future_events
    @events.select(&:is_future?).each do |event|
      puts event.to_s
      puts "----------------------"
    end
  end
end