describe "Neopet" do

  let(:sophie) { Neopet.new("Sophie") }
  let(:all_species) { get_species_list }

  describe "#name" do
    it "is instantiated with a name" do
      expect { sophie }.to_not raise_error
    end
    it "knows its name" do
      expect(sophie.name).to eq("Sophie")
    end
    it "cannot change its name" do
      expect { mandy.name=("Daffy") }.to raise_error
    end
  end

  describe "#species" do
    it "is instantiated with a species" do
      expect { sophie.species }.to_not raise_error
    end
    it "is instantiated with a species from the file names in public/img/neopets" do
      expect(sophie.species).to satisfy{|s| all_species.include?(s)}
    end
    it "knows its species" do
      expect { sophie.species }.to_not raise_error
    end
    it "cannot change its species" do
      expect { mandy.species=("cat") }.to raise_error
    end
  end

  describe "#get_points" do
    it "returns a random number between 1 and 10" do
      20.times do
        expect(sophie.get_points).to be > 0
        expect(sophie.get_points).to be < 11
      end
    end
  end

end