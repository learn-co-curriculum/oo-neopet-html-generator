require "open-uri"
require "nokogiri"
require 'pry'

class Scraper
  attr_reader :pets
  ITEM_IMAGES = ["http://images.neopets.com/items/hotdrink.gif", "http://images.neopets.com/items/coffeandmarsh.gif", "http://images.neopets.com/items/milk.gif", "http://images.neopets.com/items/food_hawaiian_bread.gif", "http://images.neopets.com/items/food_crack_ched.gif", "http://images.neopets.com/items/jinglybell.gif", "http://images.neopets.com/items/neonip_critter.gif", "http://images.neopets.com/items/redbouncyball.gif", "http://images.neopets.com/items/rubberduck.gif", "http://images.neopets.com/items/mynci_puppet.gif", "http://images.neopets.com/items/bigbrush.gif", "http://images.neopets.com/items/bluemirror.gif", "http://images.neopets.com/items/blueshorthair.gif", "http://images.neopets.com/items/toothbrush_green.gif", "http://images.neopets.com/items/groom_moon_comb.gif", "http://images.neopets.com/items/bk_blu_2.gif", "http://images.neopets.com/items/bk_tusk_2.gif", "http://images.neopets.com/items/book_cybunny_journal.gif", "http://images.neopets.com/items/book_moehog_classic.gif", "http://images.neopets.com/items/book_koi_baby.gif", "http://images.neopets.com/items/clo_shoes_blue.gif", "http://images.neopets.com/items/clo_shirt_white.gif", "http://images.neopets.com/items/clo_pants_khaki.gif", "http://images.neopets.com/items/clo_skirt_khaki.gif", "http://images.neopets.com/items/clo_hat_fishing.gif"]

  def initialize(url)
    @pets = Nokogiri::HTML(url)
  end

  def self.run(url)
    new(url).save_items.save_neopets
  end

  def save_items
    ITEM_IMAGES.each_with_index do |url|
      name = url.gsub("http://images.neopets.com/items/", "").gsub(".gif", "")
      File.open("public/img/items/#{name}.jpg", "wb") do |f|
        f.write(open(url).read)
      end
    end
  end

  def save_neopets
    neopets = pets.search("td")[18..71]
    neopets.each_with_index do |pet|
      img = pet.children[0].children[1].attributes["src"].value
      name = pet.children[0].children[3].children.text.downcase
      File.open("public/img/#{name}.jpg", "wb") do |f|
        f.write(open(img).read)
      end
    end
  end

end

Scraper.run("http://www.neopets.com/allpets.phtml")