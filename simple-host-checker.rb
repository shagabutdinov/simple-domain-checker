#!/usr/bin/env ruby

args = ARGV.clone()
if args.empty?() || args.index('--').nil?()
  puts("USAGE: ./simple-host-checker.rb head1 head2 -- tail1 tail2 " +
    "[--zone com org]")
end

zone_index = args.rindex('--zone') || args.rindex('-z')
if !zone_index.nil?()
  ZONES = args[args.rindex('--zone')+1..-1]
  args = args[0...zone_index]
else
  ZONES = ['com']
end

SEPARATORS = ['', '-']
words1 = args[0...args.index('--')]
words2 = args[args.index('--') + 1..-1]

def checkhost(host)
  taken = `#{"host #{host} 2> /dev/null | grep \"not found\""}`.strip().empty?()
  puts("[ #{taken ? "\e[31mtaken\e[0m" : "\e[32mfree\e[0m"} ]\t#{host}")
end

words1.each { |word1|
  words2.each { |word2|
    ZONES.each() { |zone|
      SEPARATORS.each() { |separator|
        checkhost("#{word1}#{separator}#{word2}.#{zone}")
      }
    }
  }
}