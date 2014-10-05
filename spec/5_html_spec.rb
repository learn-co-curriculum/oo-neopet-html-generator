describe "User - HTML Generator" do
  describe "#make_index_page" do

    before(:all) do
      lenora = User.new("Aaron Johnson") 
      lenora.items   << @first_item = Item.new 
      lenora.items   << @second_item = Item.new 
      lenora.items   << @third_item = Item.new 
      lenora.neopets << @vivi = Neopet.new("Lady Vivian") 
      lenora.neopets << @daisy = Neopet.new("Daisy") 
      lenora.make_index_page
    end
    
    it "saves an html file to views/users/ with the correct file name" do
      html_files = Dir["views/users/*.html"]
      expect(html_files).to include("views/users/aaron-johnson.html")
      html_file = File.read("views/users/aaron-johnson.html")
      expect(html_file).to match /<!DOCTYPE html>/
    end

    it "lists the user's name in a header and displays their neopoints" do
      file_path = "views/users/aaron-johnson.html"
      html_file = File.read(file_path)
      expect(html_file).to match /<h1>Aaron Johnson<\/h1>/
      expect(html_file).to match /<h3><strong>Neopoints:<\/strong> 2500<\/h3>/
    end

    it "has a section for the user's neopets" do
      html_file = File.read(Dir["views/users/*.html"][0])
      expect(html_file).to match /<h3>Neopets<\/h3>/
    end

    it "lists the user's neopets" do
      html_file = File.read(Dir["views/users/*.html"][0])
      [@vivi, @daisy].each do |pet|
        expect(html_file).to match /<img src=\"..\/..\/public\/img\/neopets\/#{pet.species}.jpg">/
        methods = [:name, :mood, :species, :strength, :defence, :movement]
        methods.each do |method|
          expect(html_file).to match /<li><strong>#{method.to_s.capitalize}:<\/strong> #{pet.send(method)}<\/li>/
        end
      end
    end

    it "has a section for the user's items" do
      html_file = File.read(Dir["views/users/*.html"][0])
      expect(html_file).to match /<h3>Items<\/h3>/
    end

    it "lists the user's items" do
      html_file = File.read(Dir["views/users/*.html"][0])
      [@first_item, @second_item, @third_item].each do |item|
        expect(html_file).to match /<img src=\"..\/..\/public\/img\/items\/#{item.type}.jpg">/
        expect(html_file).to match /<li>#{item.formatted_type}<\/li>/
      end
    end

  end
end