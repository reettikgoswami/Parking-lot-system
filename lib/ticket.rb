require 'securerandom'

class Ticket
  attr_reader :car, :date, :parking_spot, :id

  def initialize(car, parking_spot, parking_ticket)
    @id = parking_ticket
    @car = car
    @date = Time.now
    @parking_spot = parking_spot
  end
end
