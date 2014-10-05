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
    found = find_neopet_by_name(name)
    if found.class == Neopet
      self.neopets.delete(found)
      self.neopoints += 200
      "You have sold #{name}. You now have #{self.neopoints} neopoints."
    else
      "Sorry, there are no pets named #{name}."
    end
  end

  def find_neopet_by_name(name)
    self.neopets.each do |pet|
      if pet.name == name
        return pet
      end
    end
    "Sorry, there are no pets named #{name}."
  end

  def make_file_name_for_index_page
    self.name.gsub(" ", "-").downcase
  end

  def make_index_page
    File.open("views/users/#{make_file_name_for_index_page}.html", 'w') do |file| 
      file.write(get_html)
    end
  end

  def get_html
    html = "<!DOCTYPE html>\n\n<html>\n<head>\n<title>#{self.name}</title>\n</head>\n<body>\n<h1>#{self.name}</h1><h3><strong>Neopoints:</strong>#{self.neopoints}</h3>"
    add_neopets_to_html(html)
    add_items_to_html(html)
    html << "</body></html>"
  end

  def add_neopets_to_html(html)
    html << "<h3>Neopets</h3><ul>"
    self.neopets.each do |pet|
      html << "<li><img src=\"..\/..\/public/img/neopets/#{pet.species}.jpg\"></li>"
      html << "<ul>"
      html << "<li>#{pet.name}</li>"
      html << "<li><strong>Species:</strong> #{pet.species}</li>"
      html << "<li><strong>Strength:</strong> #{pet.strength}</li>"
      html << "<li><strong>Defence:</strong> #{pet.defence}</li>"
      html << "<li><strong>Movement:</strong> #{pet.movement}</li>"
      html << "</ul>"
    end
    html << "</ul>"
  end

  def add_items_to_html(html)
    html << "<h3>Items</h3>"
    html << "<ul>"
    self.items.each do |item|
      html << "<li><img src=\"..\/..\/public/img/items/#{item.type}.jpg\"></li>"
      html << "<ul><li>#{item.type}</li></ul>"
    end
    html << "</ul>"
  end


end