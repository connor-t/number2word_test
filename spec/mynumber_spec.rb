require 'mynumber'

describe 'Mynumber' do

  it "accepts a number" do
    expect{Mynumber.new( 444 )}.not_to raise_error
  end

  it "only accepts integers" do
    expect{Mynumber.new( 'hello' )}.to raise_error  "please enter an integer"
  end

  it "only accepts positive numbers" do
    expect{Mynumber.new( -7 )}.to raise_error "please enter a positive integer"
  end

  it "must be between 0 and 9999" do
    expect{Mynumber.new( 10000 )}.to raise_error "please enter a number between 0 and 9999"
  end

end

describe '#number2word' do

  it "converts 0 to zero" do
    expect( Mynumber.new(0).number2word).to eq 'zero'
  end

  it "converts 1 to 9" do
    (1..9).each do |n|
      expect( Mynumber.new(n).number2word).to eq Mynumber::ONES[n -1]
    end
  end

  it "converts 10 to 19" do
    (11..19).each_with_index do |n,i|
      expect( Mynumber.new(n).number2word).to eq Mynumber::TEENS[i]
    end
  end

  it "converts tens" do
    expect( Mynumber.new(50).number2word).to eq 'fifty'
  end

  it "converts hundreds" do
    expect( Mynumber.new(800).number2word).to eq 'eight hundred'
  end

  it "converts thousands" do
    expect( Mynumber.new(4000).number2word).to eq 'four thousand'
  end

  it "converts any number to a word" do
    expect( Mynumber.new(1001).number2word).to eq 'one thousand one'
    expect( Mynumber.new(888).number2word).to eq 'eight hundred eighty eight'
    expect( Mynumber.new(141).number2word).to eq 'one hundred forty one'
    expect( Mynumber.new(901).number2word).to eq 'nine hundred one'
    expect( Mynumber.new(77).number2word).to eq 'seventy seven'
    expect( Mynumber.new(2212).number2word).to eq 'two thousand two hundred twelve'
  end

end


