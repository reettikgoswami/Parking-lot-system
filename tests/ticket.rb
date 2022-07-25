require_relative '../lib/ticket'
require_relative '../lib/car'

require 'minitest/autorun'

class TicketTest < Minitest::Test
  def test_ticket_initialize_values
    car = Car.new('reg-ab134', 'red')
    ticket = Ticket.new(car, 5, 'tic-6f7462219308')
    assert_equal ticket.car.reg_no, 'reg-ab134'
    assert_equal ticket.id, 'tic-6f7462219308'
    assert_equal ticket.parking_spot, 5
  end
end
