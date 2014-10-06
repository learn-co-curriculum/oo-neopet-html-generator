describe "User - Give Present" do

  before(:each) do
    # user
    @mandy = User.new("Mandy Moore")
    
    # neopets
    @daisy = Neopet.new("Daisy")
    @daisy.happiness = 3
    @rusty = Neopet.new("Rusty")
    @rusty.happiness = 7
    @mandy.neopets << @daisy
    @mandy.neopets << @rusty

    # presents
    @first_present = Item.new
    @second_present = Item.new
    @mandy.items << @first_present
    @mandy.items << @second_present
  end

  it "accepts two arguments, the item (present) type and the neopet's name" do
    expect{ @mandy.give_present(@first_present.type, @daisy.name) }.to_not raise_error
  end

  it "moves the present from the user's items array to the neopet's item's array" do
    @mandy.give_present(@first_present.type, @daisy.name)
    expect(@mandy.items).to_not include(@first_present)
    expect(@daisy.items).to include(@first_present)
  end

  it "increases the neopet's happiness by 5 points, up until 10" do
    @mandy.give_present(@first_present.type, @daisy.name)
    @mandy.give_present(@second_present.type, @rusty.name)
    expect(@daisy.happiness).to eq(8)
    expect(@rusty.happiness).to eq(10)
  end

  it "returns a success message about the item, the pet, and the pet's mood" do
    expect(@mandy.give_present(@first_present.type, @daisy.name)).to eq(
      "You have given a #{@first_present.type} to #{@daisy.name}, who is now #{@daisy.mood}."
    )
  end

  it "returns a failure message if item is not found" do
    expect(@mandy.give_present("imaginary_item", @daisy.name)).to eq(
      "Sorry, an error occurred. Please double check the item type and neopet name."
    )
  end

  it "returns a failure message if neopet is not found" do
    expect(@mandy.give_present(@first_present.type, "Ralph")).to eq(
      "Sorry, an error occurred. Please double check the item type and neopet name."
    )
  end

  it "returns a failure message if neopet and item are not found" do
    expect(@mandy.give_present("imaginary_item", "Ralph")).to eq(
      "Sorry, an error occurred. Please double check the item type and neopet name."
    )
  end
end


