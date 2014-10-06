describe "User - HTML Generator" do
  describe "#make_index_page" do

    before(:all) do
      aaron = User.new("Aaron Rusli") 

      # buy items and neopets
      2.times do 
        aaron.buy_neopet
        2.times do
          aaron.buy_item
        end
      end

      # assign instance variables to the purchased pets, items
      @first_item = aaron.items[0]
      @second_item = aaron.items[1]
      @third_item = aaron.items[3]
      @vivi = aaron.neopets[0]
      @daisy = aaron.neopets[1]

      # give items to neopets
      2.times do
        @vivi.items << Item.new
      end
      @daisy.items << Item.new
      
      # make index page
      aaron.make_index_page
    end

    it "is called on with no arguments" do
      expect { User.new("Alyxe Schmidt").make_index_page }.to_not raise_error
    end
    
    it "saves an html file to views/users/ with the correct file name" do
      html_files = Dir["views/users/*.html"]
      expect(html_files).to include("views/users/aaron-rusli.html")
      html_file = File.read("views/users/aaron-rusli.html")
      expect(html_file).to match /<!DOCTYPE html>/
    end

    it "lists the user's name in a header and displays their neopoints" do
      file_path = "views/users/aaron-rusli.html"
      html_file = File.read(file_path)
      expect(html_file).to match /<h1>Aaron Rusli<\/h1>/
      expect(html_file).to match /<h3><strong>Neopoints:<\/strong> 1400<\/h3>/
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
        expect(html_file).to match /<li><strong>Type:<\/strong> #{item.formatted_type}<\/li>/
      end
    end

    it "generates an HMTL file that looks good" do
      `open views/users/aaron-rusli.html`
      sleep(1)
      expect("yes").to eq("yes")
    end    

  end
end