require 'prime'

sum = (1..2000000).to_a.select do |x|
  Prime.prime?(x)
end.reduce(:+)

puts sum
