#!/usr/bin/env ruby

# shuffle "welcome to" cards and make three stacks
set1 = %w(3 4 6 7 8 9 10 12 13) # pools, bis, temps
set2 = %w(1 2 3 5 5 6  6  7  8 8 9 10 10 11 11 13 14 15) # fences
set3 = %w(1 2 4 5 5 6  7  7  8 8 9  9 10 11 11 12 14 15) # parks, markets

# make the set of all cards
cards = {
  pool: set1,
  bis: set1,
  temp: set1,
  fence: set2,
  park: set3,
  market: set3
}
deck = cards.map do |key, values|
  values.map do |val|
    "#{val}-#{key}"
  end
end

# shuffle them
deck = deck.flatten.shuffle

# divide into three equal stacks
stack1 = deck.slice(0, 27)
stack2 = deck.slice(27, 27)
stack3 = deck.slice(54, 27)

# turn over one card from each stack
last1 = nil
last2 = nil
last3 = nil
(0 .. 26).each do |i|
  card1 = stack1[i]
  card2 = stack2[i]
  card3 = stack3[i]
  num1, _ = card1.split("-")
  num2, _ = card2.split("-")
  num3, _ = card3.split("-")
  if last1
    print "#{num1.rjust(2)} #{last1.ljust(8)}"
    print "#{num2.rjust(2)} #{last2.ljust(8)}"
    print "#{num3.rjust(2)} #{last3.ljust(8)}"
    gets
  end

  _, last1 = card1.split("-")
  _, last2 = card2.split("-")
  _, last3 = card3.split("-")
end
