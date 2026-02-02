class DateParser
  MONTHS = {
    "janvier" => 1, "février" => 2, "fevrier" => 2,
    "mars" => 3, "avril" => 4, "mai" => 5, "juin" => 6,
    "juillet" => 7, "août" => 8, "aout" => 8,
    "septembre" => 9, "octobre" => 10,
    "novembre" => 11, "décembre" => 12, "decembre" => 12
  }

  def self.parse(str)
    str = str.downcase.strip

    # --- CAS 1 : "demain à 9h" ---
    if str.include?("demain")
      base = Date.today + 1
      hour, minute = extract_hour(str)
      return Time.new(base.year, base.month, base.day, hour, minute)
    end

    # --- CAS 2 : format simple "le 19 novembre à 16 h 30" ---
    parts = str.split

    day = parts[1].to_i
    month = MONTHS[parts[2]]

    hour, minute = extract_hour(str)

    Time.new(Time.now.year, month, day, hour, minute)
  end

  # --- Méthode utilitaire pour extraire l'heure ---
  def self.extract_hour(str)
    # formats acceptés :
    # 16h30, 16h, 16 h 30, 16 h
    if str =~ /(\d{1,2})h(\d{2})?/
      hour = $1.to_i
      minute = ($2 || "0").to_i
      return [hour, minute]
    end

    # fallback : "16 h 30"
    parts = str.split
    hour = parts[4].to_i rescue 0
    minute = parts[6].to_i rescue 0

    [hour, minute]
  end
end