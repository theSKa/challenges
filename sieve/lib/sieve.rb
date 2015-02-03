require 'sieve/version'

module Sieve
  class Generator
    # infinite generator - we add a class level ordered member (array)
    # in order to reuse as much computation results over different instances (memoization)
    # Singleton is not an option :O
    # we need not to inherit from Enumerable, each, map and so on work even

    @@primes = [2,3,5] # we start with the basic ones

    def each
      return enum_for(:each) unless block_given? #cause we have infinite series
      n = 0
      while true
        yield self[n]
        n+=1
      end
    end

    def [](index)
      generate(index+1)[index]
    end

    private
    def generate(n)
      index = @@primes[-1]
      while @@primes.length < n
        index+=1
        is_prime = true
        upper_bound = Math.sqrt(index).to_i + 1
        @@primes.each do |i|
          break unless i < upper_bound && is_prime
          is_prime &&= (index % i !=0)
        end
        @@primes << index if is_prime
      end
      @@primes[0..n]
    end
  end
end