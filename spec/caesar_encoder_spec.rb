require 'spec_helper'
require_relative '../lib/caesar.rb'

describe "encodes a string" do
  it "encodes one character" do
    expect(caesar_encode('a', 3)).to eq('d')
    expect(caesar_encode('a', 1)).to eq('b')
    expect(caesar_encode('p', 3)).to eq('s')
    expect(caesar_encode('z', 3)).to eq('c')
  end

  it "returns the same value if the number is divisible by 26" do
    expect(caesar_encode('a', 26)).to eq('a')
    expect(caesar_encode('a', 52)).to eq('a')
  end

  it "preserves uppercase" do
    expect(caesar_encode('P', 3)).to eq('S')
    expect(caesar_encode('Z', 3)).to eq('C')
  end

  it "does not convert spaces" do
    expect(caesar_encode('P   P', 3)).to eq('S   S')
  end

  it "does not convert punctuation" do
    expect(caesar_encode('*&^.', 3)).to eq('*&^.')
  end

  it "converts sentences" do
    expect(caesar_encode("I'm a tiger", 5)).to eq("N'r f ynljw")
  end

  it "works with crazy high offsets" do
    expect(caesar_encode("a", 27)).to eq('b')
    expect(caesar_encode("I'm a tiger", 9500)).to eq("S'w k dsqob")
  end
end
