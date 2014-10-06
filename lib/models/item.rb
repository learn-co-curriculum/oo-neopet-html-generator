class Item
  attr_reader :type, :formatted_type

  def initialize
    @type = get_type
    @formatted_type = format_type
  end

  def get_type
    all_names = Dir["public/img/items/*.jpg"]
    all_names.sample.gsub("public/img/items/", "").gsub(".jpg", "")
  end

  def format_type
    self.type.split("_").collect {|word| word.capitalize }.join(" ")
  end

end