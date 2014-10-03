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

end