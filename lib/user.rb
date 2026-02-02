class User
  # --- ATTRIBUTS D'INSTANCE ---
  attr_accessor :email, :age


  # --- VARIABLE DE CLASSE ---
  @@all_users = []


  # --- INITIALIZE ---
  def initialize(email, age)
    @email = email
    @age = age
    @@all_users << self
  end


  # --- MÉTHODE DE CLASSE : all ---
  def self.all
    @@all_users
  end


  # --- MÉTHODE DE CLASSE : find_by_email ---
  def self.find_by_email(email)
    @@all_users.find { |user| user.email == email }
  end
end