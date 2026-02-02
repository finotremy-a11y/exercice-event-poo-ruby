class EventCreator
  def initialize
    puts "Salut, quel est l'événement que tu veux noter ?"
    title = gets.chomp
    
    puts "Ensuite, c'est quoi la date de l'événement ?"
    start_date_string = gets.chomp
    start_date = DateParser.parse(start_date_string)

    puts "Combien de temps va duree l'événement ?"
    duration = gets.chomp
    duration = duration.to_i

    puts "Qui veux tu convier a l'événement ?"
    attendees = gets.chomp
    attendees = attendees.split(",").map(&:strip)

    @event = Event.new(start_date, duration, title, attendees)

    puts "Événement créé !"
    puts @event.to_s
  end
end