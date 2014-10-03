class Neopet
  attr_reader :name, :species, :strength, :defence, :movement

  def initialize(name)
    @name = name
    @strength = randomizer
    @defence = randomizer
    @movement = randomizer
  end

  def randomizer
    rand(1..10)
  end

end