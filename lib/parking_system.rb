require_relative 'lib/parking_lot.rb'
require_relative 'lib/car.rb'

class ParkingSystem

  attr_reader  :parking_lot

  def initialize(total_parking_space)
    @parking_lot = ParkingLot.new(total_parking_space)
  end

  def park(reg_no, color)
    available_slot = parking_lot.find_available_slot
    if available_slot.present?
      car = Car.new(reg_no, color)
      parking_lot.allot_parking_space(car, available_slot)
      p `Allocated slot: #{available_slot + 1}`
    else
      p "Parking lot is full."
    end
  end

  def leave(position)
     parking_lot.leave_parking_space(position - 1)
     p `Slot number #{position + 1} is free`
  end


  def find_registration_numbers_by_color(color)
    registration_numbers = parking_lot.filter_car_by_color(color)
    registration_numbers.each do reg_no
      p registration_numbers
    end
  end  
end
