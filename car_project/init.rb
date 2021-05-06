# frozen_string_literal: true

require_relative 'lib/car'

puts "Enter information for the car you want to purchase\n"

print 'Make: '
make = gets.chomp

print 'Year: '
year = gets.chomp

print 'Color: '
color = gets.chomp

car = Car.new(make: make, year: year, color: color)

puts "\nI understand that you want to purchase: #{car.full_name}."
