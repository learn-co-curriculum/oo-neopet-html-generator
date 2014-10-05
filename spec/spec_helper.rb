require_relative "../lib/models/user.rb"
require_relative "../lib/models/neopet.rb"
require_relative "../lib/models/item.rb"

require 'fileutils'
require 'launchy'
require 'pry'
RSpec.configure do |config|
  config.order = 'default'
  config.before(:all) do
    FileUtils.rm_rf(Dir["views/users/*"]) # remove pre-existing view files
  end
  config.after(:all) do
    FileUtils.rm_rf(Dir["views/users/*"]) # remove created view files
  end
end

def get_species_list
  Dir["public/img/neopets/*.jpg"].collect {|s| s.gsub("public/img/neopets/", "").gsub(".jpg", "") } 
end

def get_item_list
  Dir["public/img/items/*.jpg"].collect {|s| s.gsub("public/img/items/", "").gsub(".jpg", "") } 
end

def spec_format_type(type)
  type.split("_").collect {|w| w.capitalize }.join(" ")
end

def __
  raise "__ should be replaced with a subjective evalution of how the generated HTML looks"
end
