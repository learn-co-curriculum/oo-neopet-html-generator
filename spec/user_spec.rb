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
      expect(mandy.neopoints=(3000).neopoints).to eq(3000)
    end
  end

  describe "#items" do
    it "starts as an empty array" do
      expect(mandy.items).to eq([])
    end
    it "allows items to be added and removed" do
      mandy.items << ["catnip", "chew toy"]
      expect(mandy.items.length).to eq(2)
      expect(mandy.items).to include(["catnip"])
      expect(mandy.items).to include(["chew toy"])
      mandy.items.shift
      expect(mandy.items.length).to eq(1)
    end
  end

  describe "#neopets" do
    it "starts as an empty array" do
      expect(mandy.items).to eq([])
    end
    it "allows pets to be added and removed" do
      mandy.items << ["jubjub", "korbat"]
      expect(mandy.items.length).to eq(2)
      expect(mandy.items).to include(["jubjub"])
      expect(mandy.items).to include(["korbat"])
      mandy.items.shift
      expect(mandy.items.length).to eq(1)
    end
  end

end