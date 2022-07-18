
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

  def filter_car_by_color(color)
    reg_no_array = []
    slots.each do |slot|
      if slot.present? && slot.color == color
        reg_no_array << slot.reg_no
      end
    end
  end

end