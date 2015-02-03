require 'rspec'
require 'sieve'
require 'prime'

describe :generator do
  it 'matches ruby implementation of primes' do
    sieve = Sieve::Generator.new
    Prime.each_with_index(100) do |prime, index|
      sieve[index].should eq prime
    end
  end

  context :class do
    subject { Sieve::Generator }
    it { should respond_to :new }
  end

  context :instance do
    subject { Sieve::Generator.new }
    it { should respond_to :each}
  end
end