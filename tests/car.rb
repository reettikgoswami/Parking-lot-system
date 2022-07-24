require_relative "../lib/car.rb"
require 'minitest/autorun'

class CarTest < Minitest::Test
  def test_just_something
    car = Car.new(2090, "red")
    assert_equal car.color, "color" 
  end
end