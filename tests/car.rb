require_relative '../lib/car'

require 'minitest/autorun'

class CarTest < Minitest::Test
  def test_car_initialize_values
    car = Car.new('reg-ab134', 'red')
    assert_equal car.reg_no, 'reg-ab134'
    assert_equal car.color, 'red'
  end
end
