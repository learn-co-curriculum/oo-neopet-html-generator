require 'pry'

class User
  attr_reader :name
  attr_accessor :neopets, :neopoints, :items

  PET_NAMES = ["Angel", "Baby", "Bailey", "Bandit", "Bella", "Buddy", "Charlie", "Chloe", "Coco", "Daisy", "Lily", "Lucy", "Maggie", "Max", "Molly", "Oliver", "Rocky", "Shadow", "Sophie", "Sunny", "Tiger"]

  def initialize(name)
    @name = name
    @neopets = []
    @items = []
    @neopoints = 2500
  end

  def select_pet_name
    current_pets = self.neopets.collect {|pet| pet.name }
    name = PET_NAMES.sample
    while current_pets.include?(name)
      name = PET_NAMES.sample
    end
    name
  end

  def buy_neopet
    if self.neopoints >= 250
      self.neopets << Neopet.new(select_pet_name)
      self.neopoints -= 250
    else
      "Sorry, you do not have enough Neopoints."
    end
  end

  def sell_neopet_by_name(name)
    pet = find_neopet_by_name(name)
    self.neopets.delete(pet)
    self.neopoints += 200
    "You have sold #{name}. You now have #{self.neopoints} neopoints."
  end

  def find_neopet_by_name(name)
    self.neopets.each do |pet|
      if pet.name == name
        return pet
      end
    end
    "Sorry, there are no pets named #{name}."
  end

  def write_index_page
    # html = "!DOCTYPE"
  end

end