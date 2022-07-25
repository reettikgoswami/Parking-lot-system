class ParkingLot
  attr_reader :slots

  def initialize(size)
    @slots = Array.new(size)
  end

  def find_available_slot
    available_slot = nil
    @slots.each_with_index do |slot, index|
      if slot.nil?
        available_slot = index
        break
      end
    end
    available_slot
  end

  def allot_parking_space(parking_ticket, position)
    @slots[position] = parking_ticket
  end

  def leave_parking_space(position)
    @slots[position] = nil
  end

  def filter_car_by_color(color)
    reg_no_array = []
    @slots.each do |ticket|
      reg_no_array << ticket.car.reg_no if ticket.present? && ticket.car.color == color
    end
    reg_no_array
  end

  def find_parking_ticket(reg_no)
    parking_ticket = nil
    @slots.each do |ticket|
      parking_ticket = ticket if ticket.present? && ticket.car.reg_no == reg_no
    end
    parking_ticket
  end

  def filter_ticket_by_color(color)
    tickets = []
    @slots.each do |ticket|
      tickets << ticket if ticket.present? && ticket.car.color == color
    end
    tickets
  end
end
