class Neopet
  attr_reader :name, :species, :strength, :defence, :movement

  def initialize(name)
    @name = name
    @species = get_species
    @strength = get_points
    @defence = get_points
    @movement = get_points
  end

  def get_species
    all_names = Dir["public/img/neopets/*.jpg"]
    all_names.sample.gsub("public/img/neopets/", "").gsub(".jpg", "")
  end

  def get_points
    rand(1..10)
  end

end