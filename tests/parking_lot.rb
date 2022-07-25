require_relative '../lib/ticket'
require_relative '../lib/car'
require_relative '../lib/parking_lot'

require 'minitest/autorun'

class ParkingLotTest < Minitest::Test
  def setup
    @parking_lot = ParkingLot.new(11)
    @parking_lot.allot_parking_space(generate_parking_ticket('Red', 'reg-001', 0, 'tic-001'), 0)
    @parking_lot.allot_parking_space(generate_parking_ticket('Black', 'reg-002', 1, 'tic-002'), 1)
    @parking_lot.allot_parking_space(generate_parking_ticket('Red', 'reg-003', 3, 'tic-003'), 3)
    @parking_lot.allot_parking_space(generate_parking_ticket('Gray', 'reg-004', 6, 'tic-004'), 6)
    @parking_lot.allot_parking_space(generate_parking_ticket('Silver', 'reg-005', 7, 'tic-005'), 7)
    @parking_lot.allot_parking_space(generate_parking_ticket('Red', 'reg-006', 9, 'tic-006'), 9)
  end

  def test_initialize_parking_lot_size_values
    parking_lot = ParkingLot.new(240)
    assert_equal parking_lot.slots.size, 240
  end

  def test_find_available_slot_function
    valid_parking_spot = @parking_lot.find_available_slot
    assert_equal valid_parking_spot, 2
    @parking_lot.allot_parking_space(generate_parking_ticket('Silver', 'reg-007', 2, 'tic-007'), 2)
    assert_equal @parking_lot.find_available_slot, 4
  end

  def test_filter_car_by_color_function
    reg_no_array = @parking_lot.filter_car_by_color('Red')
    assert_equal reg_no_array.length, 3
    assert_equal reg_no_array[0], 'reg-001'
    assert_equal reg_no_array[1], 'reg-003'
    assert_equal reg_no_array[2], 'reg-006'
  end

  def test_find_parking_ticket_function
    parking_ticket = @parking_lot.find_parking_ticket('reg-002')
    assert_equal parking_ticket.id, 'tic-002'
    assert_equal parking_ticket.car.color, 'Black'
    assert_equal parking_ticket.parking_spot, 1
  end

  def test_filter_ticket_by_color_function
    parking_tickets = @parking_lot.filter_ticket_by_color('Red')
    assert_equal parking_tickets.length, 3
    assert_equal parking_tickets[0].id, 'tic-001'
    assert_equal parking_tickets[1].id, 'tic-003'
    assert_equal parking_tickets[2].id, 'tic-006'
  end

  private

  def generate_parking_ticket(car_color, car_reg_no, spot, ticket_id)
    car = Car.new(car_reg_no, car_color)
    Ticket.new(car, spot, ticket_id)
  end
end
