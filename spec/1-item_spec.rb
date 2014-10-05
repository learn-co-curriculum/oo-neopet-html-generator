describe "Item" do
  let(:item) { Item.new }
  let(:all_items) { get_item_list }

  it "can be instantiated with no arguments" do
    expect { item }.to_not raise_error
  end

  describe "#type" do
    it "knows its type" do
      expect { item.type }.to_not raise_error
    end
    it "cannot change its type" do
      expect { item.type=("Jessica Simpson") }.to raise_error
    end
    it "calls on #get_type within the initialize method to assign an item type" do
      item_contents = File.read("lib/models/item.rb")
      expect(item_contents.scan(/@type = get_type/).length).to eq 1
    end
  end

  describe "#get_type" do
    it "generates a random type from all possible item types, found in public/img/items" do
      expect(item.get_type).to satisfy{|t| all_items.include?(t)}
      expect(item.get_type).to_not eq(item.get_type)
    end
  end

  describe "#format_type" do
    it "replaces the underscores in the type with spaces and capitalizes the name" do
      expect(item.format_type).to eq(spec_format_type(item.type))
    end
  end

end