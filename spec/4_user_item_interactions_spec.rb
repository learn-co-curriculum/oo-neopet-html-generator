describe "User - Item Interactions" do
  
  let(:mandy) { User.new("Mandy Moore") }
  
  describe "#buy_item" do

    it "can be instantiated with no arguments" do
      expect { mandy.buy_item }.to_not raise_error
    end

    it "costs 150 neopoints" do
      mandy.neopoints = 150
      mandy.buy_item
      expect(mandy.neopoints).to eq(0)
    end

    it "allows users with at least 150 neopoints to buy an item" do
      original_item_num = mandy.items.length
      mandy.neopoints = 150
      mandy.buy_item
      expect(mandy.items.length).to eq(original_item_num + 1)
    end

    it "blocks users with less than 150 neopoints from buying a neopoint" do
      original_item_num = mandy.items.length
      mandy.neopoints = 149
      mandy.buy_item
      expect(mandy.items.length).to eq(original_item_num)
      expect(mandy.neopoints).to eq(149)
    end

    it "creates a new instance of Item and adds item to user's items" do
      original_item_num = mandy.items.length
      mandy.neopoints = 2000
      mandy.buy_item
      expect(mandy.items.length).to eq(original_item_num + 1)
      mandy.items.each do |item|
        expect(item.class).to eq(Item)
      end
    end

    it "returns a message about the item type that the user purchased" do
      mandy.neopoints = 2000
      expect(mandy.buy_item).to eq("You have purchased a #{mandy.items[-1].type}.")
    end

    it "returns an apology message if user has insufficient neopoints" do
      mandy.neopoints = 149
      expect(mandy.buy_item).to eq("Sorry, you do not have enough Neopoints.")
    end
  end

  describe "#find_item_by_type" do
    let(:new_item) { Item.new }
    it "accepts one argument" do
      mandy.buy_item
      item_name = mandy.items[-1].type
      expect { mandy.find_item_by_type(item_name) }.to_not raise_error
    end

    it "finds the item that has a type that matches" do
      item_type = new_item.type
      mandy.items << new_item
      expect(mandy.find_item_by_type(item_type)).to eq(new_item)
    end

    it "returns nil if it can't find a item" do
      mandy.items << new_item
      expect(mandy.find_item_by_type("xisi45fwoersfs")).to eq(nil)
    end
  end

end