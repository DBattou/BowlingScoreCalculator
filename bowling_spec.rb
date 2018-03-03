require 'rspec'
require_relative 'bowling'

RSpec.describe Bowling, "#score" do
  context "Perfect gutter game no points at all" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      20.times {bowling.hit(0)}
      expect(bowling.giveMeTheScore).to be(0)
    end
  end

  context "Game with some points but no spare or strike" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      20.times {bowling.hit(2)}
      expect(bowling.giveMeTheScore).to be(40)
    end
  end

  context "Game with ONE spare at the beginning and only 2pts hits right after" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      bowling.hit(2)
      bowling.hit(8)
      18.times{bowling.hit(2)}
      expect(bowling.giveMeTheScore).to be(48)
    end
  end

  context "Game with TWO spare in a row and only 2pts hits right after" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      bowling.hit(2)
      bowling.hit(8)
      bowling.hit(4)
      bowling.hit(6)
      16.times{bowling.hit(2)}
      expect(bowling.giveMeTheScore).to be(58)
    end
  end

  context "Game with ONLY spare" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      10.times{
        bowling.hit(2)
        bowling.hit(8)
      }
      bowling.hit(6)
      expect(bowling.giveMeTheScore).to be(124)
    end
  end

  context "Game with one strike and only 2pts hits right after" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      bowling.hit(10)
      bowling.hit(0)
      18.times{bowling.hit(2)}
      expect(bowling.giveMeTheScore).to be(50)
    end
  end

  context "Game with 2 strike in a row and only 2pts hit right after" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      2.times{
        bowling.hit(10)
        bowling.hit(0)
      }
      16.times{bowling.hit(2)}
      expect(bowling.giveMeTheScore).to be(68)
    end
  end

  context "Game only strike" do
    it "Sums the pin count for each rolls" do
      bowling = Bowling.new
      10.times{
        bowling.hit(10)
        bowling.hit(0)
      }
      bowling.hit(2)
      bowling.hit(6)
      expect(bowling.giveMeTheScore).to be(280)
    end
  end
end