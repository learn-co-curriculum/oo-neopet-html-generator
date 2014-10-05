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

  describe "#intialize" do
    before(:all) do
      @neopet_contents = File.read("lib/models/neopet.rb")
    end
    it "calls on #get_points to assign strength, defence, and movement" do
      expect(@neopet_contents.scan(/@strength = get_points/).length).to eq 1
      expect(@neopet_contents.scan(/@defence = get_points/).length).to eq 1
      expect(@neopet_contents.scan(/@movement = get_points/).length).to eq 1
    end
    it "calls on #get_species to assign species" do
      expect(@neopet_contents.scan(/@species = get_species/).length).to eq 1
    end
  end

  describe "#species" do
    it "is instantiated with a species" do
      expect { sophie.species }.to_not raise_error
    end
    it "knows its species" do
      expect { sophie.species }.to_not raise_error
    end
    it "cannot change its species" do
      expect { mandy.species=("cat") }.to raise_error
    end
  end

  describe "#get_species" do
    it "selects a random species from the file names in public/img/neopets" do
      expect(sophie.species).to satisfy{|s| all_species.include?(s)}
      expect(sophie.species).to_not eq(Neopet.new("Shiloh").species)
    end
  end

  describe "#get_points" do
    it "returns a random number between 1 and 10" do
      expect(sophie.get_points).to_not eq(Neopet.new("Shiloh").get_points)
      20.times do
        expect(sophie.get_points).to be > 0
        expect(sophie.get_points).to be < 11
      end
    end
  end

  describe "#strength, #defence, #movement" do
    it "knows its strength, defence, and movement" do
      expect { sophie.strength }.to_not raise_error
      expect { sophie.defence }.to_not raise_error
      expect { sophie.movement }.to_not raise_error
    end

    it "sets strength, defence, and movement to integers between 1 and 10" do
      expect(sophie.strength.class).to eq(Fixnum)
      expect(sophie.defence.class).to eq(Fixnum)
      expect(sophie.movement.class).to eq(Fixnum)
    end
  end

end