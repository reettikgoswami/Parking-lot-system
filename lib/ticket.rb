require 'securerandom'

class Ticket
  attr_reader :car, :date, :parking_spot, :id

  def initialize(car, parking_slot)
    @id = generate_parking_ticket
    @car = car
    @date = Time.now
    @parking_slot = parking_slot
  end

  private

  def generate_parking_ticket
    'tic-' + SecureRandom.hex(6)
  end
end
