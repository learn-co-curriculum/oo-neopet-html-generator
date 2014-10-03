class User
  attr_reader :name
  attr_accessor :neopets, :neopoints, :items

  def initialize(name)
    @name = name
    @neopets = []
    @items = []
    @neopoints = 2500
  end

end