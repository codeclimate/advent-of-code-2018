#!/usr/bin/ruby

counters = Hash.new(0)

File.read("./day2_input.txt").lines do |line|
  counter = line.strip.split("").
            group_by{ |e| e }.
            map { |k, dups|[k, dups.size] }.to_h

  [2,3].each do |num|
    if counter.any? { |k,v| v == num }
      counters[num] += 1
    end
  end
end

puts counters.values.inject(:*)
