#!/usr/bin/ruby

lines = File.read("./day2_input.txt").lines

match_found = false
for i in 0..(lines.length-1) do
  break if match_found

  outer_chars = lines[i].strip.split("")

  for j in (i+1)..(lines.length-1) do
    inner_chars = lines[j].strip.split("")

    match_str = ""
    num_misses = 0
    outer_chars.each_with_index do |outer_char, idx|
      if inner_chars[idx] == outer_char
        match_str += outer_char
      else
        num_misses += 1
      end

      break if num_misses > 1
    end

    if num_misses == 1
      match_found = true
      puts "Match \"#{match_str}\" found between lines #{i+1} and #{j+1}" # note: lines 1-indexed
      break
    end
  end
end
