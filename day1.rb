#!/usr/bin/env ruby

lines = File.read("./day1_input.txt").lines

keep_looping = true
sum = 0
freq = {}

while keep_looping
  File.read("./day1_input.txt").lines do |line|
    current_num = line.to_i
    sum += current_num

    if freq[sum] == true
      puts sum
      keep_looping = false
      break
    end

    freq[sum] = true
  end
end
