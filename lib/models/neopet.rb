class Neopet
  attr_reader :name, :species, :strength, :defence, :movement
  attr_accessor :happiness, :items
  
  def initialize(name)
    @name = name
    @items = []
    @species = get_species
    @strength = get_points
    @defence = get_points
    @movement = get_points
    @happiness = get_points
  end

  def get_species
    all_names = Dir["public/img/neopets/*.jpg"]
    all_names.sample.gsub("public/img/neopets/", "").gsub(".jpg", "")
  end

  def get_points
    rand(1..10)
  end

  def mood
    if self.happiness < 3
      "depressed"
    elsif self.happiness < 5
      "sad"
    elsif self.happiness < 7
      "meh"
    elsif self.happiness < 9
      "happy"
    else
      "ecstatic"
    end
  end

end