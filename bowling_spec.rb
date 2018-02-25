require 'rspec'
require_relative 'bowling.rb'

describe 'Bowling score' do

  it 'should be null' do
    game = Bowling.new("0"*20)
    expect(game.score).to be(0)
  end

  it 'one roll with 5 pins' do
    game = Bowling.new("5" + "0" * 19)
    expect(game.score).to be(5)
  end

  it '5 good rolls without strikes or sper' do
    game = Bowling.new("546786" + "0" * 15)
    expect(game.score).to be(36)
  end

  it 'one sper with 2 pins at the first roll' do
    game = Bowling.new("2/" + "0" * 15)
    expect(game.score).to be(10)
  end

  it 'one sper with 2 pins at the first roll and 2 at the next roll' do
    game = Bowling.new("2/2" + "0" * 16)
    expect(game.score).to be(14)
  end

  it '2sper in a row' do
    game = Bowling.new("2/2/" + "0" * 16)
    expect(game.score).to be(22)
  end

  it '1strike followed by non sper frames' do
    game = Bowling.new("X2451" + "0" * 14)
    expect(game.score).to be(28)
  end

  it '1strike followed by sper' do
    game = Bowling.new("X2/" + "0" * 14)
    expect(game.score).to be(30)
  end

  it 'sper followed by strike' do
    game = Bowling.new("2/X" + "0" * 14)
    expect(game.score).to be(30)
  end

  it '2 strike in a row' do
    game = Bowling.new("XX" + "0" * 14)
    expect(game.score).to be(30)
  end

  it '3 strike in a row' do
    game = Bowling.new("XXX" + "0" * 14)
    expect(game.score).to be(60)
  end

  it '7 strike in a row' do
    game = Bowling.new("XXXXXXX" + "0" * 14)
    expect(game.score).to be(180)
  end

  it '3 sper in a row' do
    game = Bowling.new("5/4/6/" + "0" * 14)
    expect(game.score).to be(40)
  end

  it '7 sper/strikes in a row' do
    game = Bowling.new("5/X5/X5/X5/X" + "0" * 4)
    expect(game.score).to be(150)
  end

  it 'only strikes' do
    game = Bowling.new("XXXXXXXXXXXX")
    expect(game.score).to be(300)
  end
end