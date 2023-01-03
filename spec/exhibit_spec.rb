require 'rspec'
require './lib/exhibit'

RSpec.describe Exhibit do
  it "exists" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

    it "has a name" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.name).to eq("Gems and Minerals")
  end
  
end
