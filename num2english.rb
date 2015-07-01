require_relative 'lib/mynumber'

number = ARGV.first

mynumber = Mynumber.new(number.to_i)

puts mynumber.number2word

