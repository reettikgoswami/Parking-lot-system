class Ticket
  attr_reader :car, :date, :parking_spot

  def initialize(car, date, parking_slot)
      @car = car
      @date = date
      @parking_slot = parking_slot
  end

end