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
    it "calls on #get_points to assign strength, defence, movement, and happiness" do
      ["@strength", "@defence", "@movement", "@happiness"].each do |attr|
        expect( @neopet_contents.scan(/#{attr} = get_points/).length).to eq 1
      end
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
      container = []
      100.times do 
        container << sophie.get_species
      end
      expect(container.uniq.length).to be > 5
    end
  end

  describe "#get_points" do
    it "returns a random number between 1 and 10" do
      container = []  
      100.times do
        container << num = sophie.get_points
        expect(num).to be > 0
        expect(num).to be < 11
      end
      expect(container.uniq.length).to be > 5
    end
  end

  describe "#strength, #defence, #movement, #happiness" do

    let(:method_list) {  [:strength, :defence, :movement, :happiness] }
    let(:set_attributes) { [:strength=, :defence=, :movement=] }

    it "knows its strength, defence, movement, and happiness" do
      method_list.each do |method|
        expect { sophie.send(method) }.to_not raise_error
      end
    end
    it "sets strength, defence, movement, and happiness to integers between 1 and 10" do
      method_list.each do |method|
        expect(sophie.send(method).class).to eq(Fixnum)
      end
    end
    it "can't change its strength, defence, or movement" do
      set_attributes.each do |method|
        expect { sophie.send(method, 8) }.to raise_error
      end
    end
  end

  describe "#happiness" do
    it "can change its happiness" do
      expect { sophie.happiness=(9) }.to_not raise_error
      [7,10].each do |num|
        sophie.happiness = num
        expect(sophie.happiness).to eq(num)
      end
    end
  end

end