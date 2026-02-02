require 'time'

class Event
  # --- ATTRIBUTS D'INSTANCE ---
  attr_accessor :start_date, :duration, :title, :attendees

  # --- INITIALIZE ---
  def initialize(start_date, duration, title, attendees)
    @start_date = start_date.is_a?(Time) ? start_date : Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
  end

  # --- MÉTHODES D'INSTANCE ---
  def postpone_24h
    @start_date = @start_date + 24*60*60
  end

  def end_date
    start_date + duration*60
  end

  def is_past?
    end_date < Time.now
  end

  def is_future?
    start_date > Time.now
  end

  def is_soon?
    start_date > Time.now && start_date - Time.now < 30*60
  end

  def to_s
    "Titre : #{title}\n"\
    "Date de debut : #{start_date.strftime("%Y-%m-%d %H:%M")}\n"\
    "Duree : #{duration} minutes\n"\
    "Participants : #{attendees.join(",")}"
  end
end