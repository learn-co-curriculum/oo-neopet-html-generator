describe "User - Neopet Interactions" do
  
  let(:mandy) { User.new("Mandy Moore") }
  
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

    it "blocks users with less than 250 neopoints from buying a neopoint" do
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

    it "calls on #select_pet_name to create the new neopet name" do
      user_contents = File.read("lib/models/user.rb")
      expect(user_contents.scan(/Neopet.new\(select_pet_name\)/).length).to eq 1
    end

    it "returns a message about the pet species and name that user purchased" do
      mandy.neopoints = 2000
      expect(mandy.buy_neopet).to eq("You have purchased a #{mandy.neopets[-1].species} named #{mandy.neopets[-1].name}.")
    end

    it "returns an apology message if user has insufficient neopoints" do
      mandy.neopoints = 149
      expect(mandy.buy_item).to eq("Sorry, you do not have enough Neopoints.")
    end
  end

  describe "#find_neopet_by_name" do
    it "accepts one argument" do
      mandy.buy_neopet
      neopet_name = mandy.neopets[-1].name
      expect { mandy.find_neopet_by_name(neopet_name) }.to_not raise_error
    end

    it "finds the pet that has a name that matches" do
      vivi = Neopet.new("Lady Vivian")
      mandy.neopets << vivi
      expect(mandy.find_neopet_by_name("Lady Vivian")).to eq(vivi)
    end

    it "returns nil if it can't find a pet" do
      mandy.neopets << Neopet.new("Lady Vivian")
      expect(mandy.find_neopet_by_name("Lady")).to eq(nil)
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
      expect(mandy.sell_neopet_by_name("Lady")).to eq("Sorry, there are no pets named Lady.")
    end

    it "does not alter the neopoints if the pet isn't found" do
      nonexistent_pet_name = "wireukls;dj;isjfsdjs"
      original_neopoints = mandy.neopoints
      mandy.find_neopet_by_name(nonexistent_pet_name)
      expect(mandy.neopoints).to eq(original_neopoints)
    end
  end

  describe "#feed_neopet_by_name" do
    before(:each) do
      @gabriela = User.new("Gabriela Quintero")
      @shiloh = Neopet.new("Shiloh")
      @bruce =  Neopet.new("Bruce")
      @shiloh.happiness = 8
      @gabriela.neopets << @shiloh
      @gabriela.neopets << @bruce
    end
    it "accepts one argument, the pet's name" do
      expect { @gabriela.feed_neopet_by_name("Shiloh") }.to_not raise_error
    end
    it "increases the pet's happiness by 2 points if it's current happiness is less than 9" do
      @shiloh.happiness = 8
      @gabriela.feed_neopet_by_name("Shiloh")
      expect(@shiloh.happiness).to eq(10)
      @bruce.happiness = 3
      @gabriela.feed_neopet_by_name("Bruce")
      expect(@shiloh.happiness).to eq(5)
    end
    it "increases the pet's happiness by 1 point if it's current happiness is 9" do
      @shiloh.happiness = 9
      @gabriela.feed_neopet_by_name("Shiloh")
      expect(@shiloh.happiness).to eq(10)
    end
    it "does not increase the pet's happiness if it is already at 10" do
      @shiloh.happiness = 10
      @gabriela.feed_neopet_by_name("Shiloh")
      expect(@shiloh.happiness).to eq(10)
    end
    it "returns a message about the fed pet's mood" do
      @shiloh.happiness = 6
      expect(@gabriela.feed_neopet_by_name("Shiloh")).to eq("After feeding, Shiloh is happy.")
      @bruce.happiness = 6
      expect(@gabriela.feed_neopet_by_name("Bruce")).to eq("After feeding, Bruce is happy.")
    end
    it "returns a message if the pet cannot be fed because it's already at 10 happiness" do
      @shiloh.happiness = 10
      expect(@gabriela.feed_neopet_by_name("Shiloh")).to eq("Sorry, feeding was unsuccessful as Shiloh is already ecstatic.")
      @bruce.happiness = 10
      expect(@gabriela.feed_neopet_by_name("Bruce")).to eq("Sorry, feeding was unsuccessful as Bruce is already ecstatic.")      
    end
  end

end