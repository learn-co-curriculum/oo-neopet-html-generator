require_relative "../lib/models/user.rb"
require_relative "../lib/models/neopet.rb"
require_relative "../lib/models/item.rb"

require 'fileutils'

RSpec.configure do |config|
  config.order = 'default'
  config.before(:all) do
    FileUtils.rm_rf(Dir["views/users/*"]) # remove pre-existing view files
  end
  config.after(:all) do
    FileUtils.rm_rf(Dir["views/users/*"]) # remove created view files
  end
end
