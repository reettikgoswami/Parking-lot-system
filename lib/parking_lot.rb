
class ParkingLot
  
  def initialize(size)
    @slots = Array.new(size)
  end

  def find_available_slot
    slots.each_with_index do |slot, index|
      return index if slot.nil?
    end
  end

  def allot_parking_space(car, position)
    slots[position] = car
  end

  def leave_parking_space(position)
    slots[position] = nil
  end

end