class Item
  attr_reader :type

  def initialize
    @type = get_type
  end

  def get_type
    all_names = Dir["public/img/items/*.jpg"]
    all_names.sample.gsub("public/img/items/", "").gsub(".jpg", "")
  end

end