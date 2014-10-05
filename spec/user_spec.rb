describe "User" do
  let(:mandy) { User.new("Mandy Moore") }

  describe "#name" do
    it "is instantiated with a name" do
      expect { mandy }.to_not raise_error
    end
    it "knows its name" do
      expect(mandy.name).to eq("Mandy Moore")
    end
    it "cannot change its name" do
      expect { mandy.name=("Jessica Simpson") }.to raise_error
    end
  end

  describe "#neopoints" do
    it "is instantiated with a 2,500 neopoints" do
      expect(mandy.neopoints).to eq(2500)
    end
    it "can change its value" do
      mandy.neopoints = 3000
      expect(mandy.neopoints).to eq(3000)
    end
  end

  describe "#items" do
    it "starts as an empty array" do
      expect(mandy.items).to eq([])
    end
    it "allows items to be added and removed" do
      mandy.items << first_item = Item.new
      mandy.items << second_item = Item.new
      expect(mandy.items.length).to eq(2)
      expect(mandy.items).to include(first_item)
      expect(mandy.items).to include(second_item)
      mandy.items.shift
      expect(mandy.items.length).to eq(1)
    end
  end

  describe "#neopets" do
    it "starts as an empty array" do
      expect(mandy.items).to eq([])
    end
    it "allows pets to be added and removed" do
      mandy.neopets << princess = Neopet.new("Princess")
      mandy.neopets << sir = Neopet.new("Sir Whiskers")
      expect(mandy.neopets.length).to eq(2)
      expect(mandy.neopets).to include(princess)
      expect(mandy.neopets).to include(sir)
      mandy.neopets.shift
      expect(mandy.neopets.length).to eq(1)
    end
  end

  describe "#select_pet_name" do
    it "uses the PET_NAMES array to choose a unique pet name" do
      modified_names = ["Angel", "Baby", "Bailey", "Bella", "Buddy", "Charlie", "Chloe", "Coco", "Lily", "Lucy", "Maggie", "Max", "Molly", "Oliver", "Shadow", "Sophie", "Sunny", "Tiger"]
      modified_names.each {|n| mandy.neopets << Neopet.new(n)}
      expect(mandy.select_pet_name).to satisfy {|s| ["Daisy","Rocky","Bandit"].include?(s) }
    end
  end

  describe "#buy_neopet" do
    it "costs 250 neopoints" do
      mandy.neopoints = 250
      mandy.buy_neopet
      expect(mandy.neopoints).to eq(0)
    end

    it "allows users with at least 250 neopoints to buy a neopoint" do
      initial_pet_number = mandy.neopets.length
      mandy.neopoints = 250
      mandy.buy_neopet
      expect(mandy.neopets.length).to eq(initial_pet_number + 1)
    end

    it "blocks users with less than 249 neopoints from buying a neopoint" do
      initial_pet_number = mandy.neopets.length
      mandy.neopoints = 249
      mandy.buy_neopet
      expect(mandy.neopets.length).to eq(initial_pet_number)
      expect(mandy.neopoints).to eq(249)
    end

    it "creates a new instance of Neopet and adds pet to user's neopets" do
      initial_pet_number = mandy.neopets.length
      mandy.buy_neopet
      expect(mandy.neopets.length).to eq(initial_pet_number + 1)
      mandy.neopets.each do |pet|
        expect(pet.class).to eq(Neopet)
      end
    end
  end

  describe "#find_neopet_by_name" do
    it "accepts one argument" do
      mandy.buy_neopet
      neopet_name = mandy.neopets[0].name
      expect { mandy.find_neopet_by_name(neopet_name) }.to_not raise_error
    end

    it "finds the pet that has a name that matches" do
      vivi = Neopet.new("Lady Vivian")
      mandy.neopets << vivi
      expect(mandy.find_neopet_by_name("Lady Vivian")).to eq(vivi)
    end

    it "apologizes if it can't find a pet" do
      mandy.neopets << Neopet.new("Lady Vivian")
      expect(mandy.find_neopet_by_name("Lady")).to eq("Sorry, there are no pets named Lady.")
    end
  end

  describe "#sell_neopet_by_name" do
    it "accepts one argument, the pet's name" do
      mandy.buy_neopet
      neopet_name = mandy.neopets[0].name
      expect { mandy.sell_neopet_by_name(neopet_name) }.to_not raise_error
    end

    it "returns a string that gives a message about selling and the users neopoints" do
      vivi = Neopet.new("Lady Vivian")
      mandy.neopets << vivi
      expect(mandy.sell_neopet_by_name("Lady Vivian")).to eq("You have sold Lady Vivian. You now have 2700 neopoints.")
    end

    it "removes the neopet from the neopets array" do
      vivi = Neopet.new("Lady Vivian")
      mandy.neopets << vivi
      mandy.sell_neopet_by_name("Lady Vivian")
      expect(mandy.neopets).to_not include(vivi)
    end

    it "increments the seller's neopoints by 200" do
      original_neopoints = mandy.neopoints
      mandy.neopets << Neopet.new("Lady Vivian")
      mandy.sell_neopet_by_name("Lady Vivian")
      expect(mandy.neopoints).to eq(original_neopoints + 200)
    end

    it "apologizes if it can't find a pet" do
      mandy.neopets << Neopet.new("Lady Vivian")
      expect(mandy.find_neopet_by_name("Lady")).to eq("Sorry, there are no pets named Lady.")
    end

    it "does not alter the neopoints if the pet isn't found" do
      original_neopoints = mandy.neopoints
      mandy.neopets << Neopet.new("Lady Vivian")
      mandy.find_neopet_by_name("Lsfsfy")
      expect(mandy.neopoints).to eq(original_neopoints)
    end
  end

  describe "#make_file_name_for_index_page" do
    it "replaces spaces in the user's name with dashes" do
      expect(mandy.make_file_name_for_index_page.downcase).to eq("mandy-moore")
    end

    it "it lowercases every letter" do
      expect(mandy.make_file_name_for_index_page).to eq("mandy-moore")
    end
  end

  describe "#make_index_page" do

    before(:all) do
      lenora = User.new("Aaron Johnson") 
      lenora.items   << @first_item = Item.new 
      lenora.items   << @second_item = Item.new 
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
      Launchy.open(file_path)
      html_file = File.read(file_path)
      expect(html_file).to match /<h1>Aaron Johnson<\/h1>/
      expect(html_file).to match /<h3><strong>Neopoints:<\/strong>2500<\/h3>/
    end

    it "has a section for the user's neopets" do
      html_file = File.read(Dir["views/users/*.html"][0])
      expect(html_file).to match /<h3>Neopets<\/h3>/
    end

    it "lists the user's neopets" do
      html_file = File.read(Dir["views/users/*.html"][0])
      [@vivi, @daisy].each do |pet|
        expect(html_file).to match /<img src=\"..\/..\/public\/img\/neopets\/#{pet.species}.jpg">/
        expect(html_file).to match /<li>#{pet.name}<\/li>/
        expect(html_file).to match /<li><strong>Species:<\/strong> #{pet.species}<\/li>/
        expect(html_file).to match /<li><strong>Strength:<\/strong> #{pet.strength}<\/li>/
        expect(html_file).to match /<li><strong>Defence:<\/strong> #{pet.defence}<\/li>/
        expect(html_file).to match /<li><strong>Movement:<\/strong> #{pet.movement}<\/li>/
      end
    end

    it "has a section for the user's items" do
      html_file = File.read(Dir["views/users/*.html"][0])
      expect(html_file).to match /<h3>Items<\/h3>/
    end

    it "lists the user's items" do
      html_file = File.read(Dir["views/users/*.html"][0])
      [@first_item, @second_item].each do |item|
        expect(html_file).to match /<img src=\"..\/..\/public\/img\/items\/#{item.type}.jpg">/
        expect(html_file).to match /<li>#{item.type}<\/li>/
      end
    end

  end
end