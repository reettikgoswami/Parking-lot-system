class ParkingLot
  def initialize(size)
    @slots = Array.new(size)
  end

  def find_available_slot
    slots.each_with_index do |slot, index|
      return index if slot.nil?
    end
  end

  def allot_parking_space(parking_ticket, position)
    slots[position] = parking_ticket
  end

  def leave_parking_space(position)
    slots[position] = nil
  end

  def filter_car_by_color(color)
    reg_no_array = []
    slots.each do |ticket|
      reg_no_array << ticket.car.reg_no if ticket.present? && ticket.car.color == color
    end
  end

  def find_parking_ticket(reg_no)
    slots.each do |ticket|
      return ticket if ticket.present? && ticket.car.reg_no == reg_no
    end
  end

  def filter_ticket_by_color(color)
    tickets = []
    slots.each do |ticket|
      tickets << ticket.car.reg_no if ticket.present? && ticket.car.color == color
    end
  end
end
