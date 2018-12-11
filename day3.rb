#!/usr/bin/ruby

counters = Hash.new(0)

#1 @ 551,185: 21x10
#<id> @ <left,top>: <widthxheight>

box = []

File.read("input/day3.txt").lines do |line|
  _, left, top, width, height = line.match(/^\#\d+ \@ (\d+),(\d+): (\d+)x(\d+)$/).to_a.map(&:to_i)

  # todo: off by 1?
  (0..(left + width - 1)).each do |x|
    box[x] ||= []

    (0..(top + height - 1)).each do |y|
      box[x][y] ||= 0

      first_x_mark = left
      last_x_mark = first_x_mark + width - 1

      first_y_mark = top
      last_y_mark = first_y_mark + height - 1

      if ((first_x_mark <= x && x <= last_x_mark) && (first_y_mark <= y && y <= last_y_mark))
        box[x][y] = 1
      end
    end
  end

  box.each_with_index do |rows, x|
    rows.each_with_index do |cols, y|
      print "#{box[x][y]} "
    end
    print "\n"
  end

  break
end
