require "hand_spec"
require 'rspec'
require 'card.rb'
describe "card" do
  subject { Card.new(:clubs,:deuce) }

  it "should have the correct suit and value" do
    Card.suits.include?(:clubs).should == true
    Card.values.include?(:deuce).should == true
  end
end