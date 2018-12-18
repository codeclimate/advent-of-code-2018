polymer = File.read("./input/day5.txt").strip.split("")

def react?(a, b)
  a.upcase == b.upcase && a != b
end

index = 1

while index < polymer.size
  last_char = polymer[index - 1]
  this_char = polymer[index]

  if index != 0 && react?(this_char, last_char)
    polymer.slice!(index - 1, 2)
    index -= 1
  else
    index += 1
  end
end

puts polymer.size
