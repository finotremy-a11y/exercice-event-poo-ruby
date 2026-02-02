require 'date'

class CalendarDisplayer
  def initialize(events)
    @events = events
  end

  def display_month(year, month)
    # 1. Construire un tableau vide pour le mois
    days_in_month = Date.new(year, month, -1).day
    first_day = Date.new(year, month, 1).wday # 0 = dimanche
    first_day = 7 if first_day == 0

    calendar = Array.new(6) { Array.new(7, "") }

    # 2. Remplir les jours
    day = 1
    row = 0
    col = first_day - 1

    while day <= days_in_month
      calendar[row][col] = day
      day += 1
      col += 1
      if col == 7
        col = 0
        row += 1
      end
    end

    # 3. Ajouter les événements
    @events.each do |event|
      if event.start_date.year == year && event.start_date.month == month
        d = event.start_date.day
        calendar.each_with_index do |week, r|
          week.each_with_index do |cell, c|
            if cell == d
              calendar[r][c] = "#{d}\n#{event.start_date.strftime("%H:%M")}\n#{event.title}"
            end
          end
        end
      end
    end

    # 4. Affichage ASCII propre
    puts "-" * 80
    calendar.each do |week|
      cell_lines = Array.new(4) { "" }

      week.each do |cell|
        content = cell.to_s.split("\n")
        content << "" while content.size < 4
        content = content.map { |l| l.ljust(10) }

        4.times do |i|
          cell_lines[i] += "|#{content[i]}"
        end
      end

      cell_lines.each { |l| puts l + "|" }
      puts "-" * 80
    end
  end
end