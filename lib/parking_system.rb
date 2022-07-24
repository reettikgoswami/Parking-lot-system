require_relative 'parking_lot'
require_relative 'car'
require_relative 'ticket'

class ParkingSystem
  attr_reader :parking_lot

  def initialize(total_parking_space)
    @parking_lot = ParkingLot.new(total_parking_space)
    @track_tickets = {}
  end

  def park(reg_no, color)
    available_slot = parking_lot.find_available_slot
    if available_slot.present?
      car = Car.new(reg_no, color)
      parking_ticket = Ticket.new(car, available_slot)
      parking_lot.allot_parking_space(parking_ticket, available_slot)
      track_tickets[parking_ticket.id] = parking_ticket
      print_parking_recite(parking_ticket)
    else
      p 'Parking lot is full.'
    end
  end

  def leave(parking_ticket_id)
    unless track_tickets[parking_ticket_id].present?
      p 'Invalid parking ticket!'
      return
    end
    @track_tickets.delete(parking_ticket_id)
    parking_spot parking_lot.leave_parking_space(parking_ticket_id)
    p `Slot number #{parking_spot + 1} is free`
  end

  def find_registration_numbers_by_color(color)
    registration_numbers = parking_lot.filter_car_by_color(color)
    registration_numbers.each do
      reg_no
      p registration_numbers
    end
    # return  registration_numbers
  end

  def find_tickets_by_color(color)
    parking_tickets = parking_lot.filter_ticket_by_color(color)
    p 'Tickets not found!' unless parking_tickets.present?
    parking_tickets.each do |ticket|
      print_parking_recite(ticket)
    end
  end

  def find_parking_ticket_by_registration_number(reg_no)
    parking_ticket = parking_lot.find_parking_ticket(reg_no)
    if parking_ticket.present?
      print_parking_recite(parking_ticket)
    else
      p 'Parking ticket not found!'
    end
  end

  private

  def print_parking_recite(parking_ticket)
    p '==============================================='
    p `Allocated slot: #{parking_ticket.parking_slot}`
    p `Parking ticket ID: #{parking_ticket.id}`
    p `Registration number: #{parking_ticket.car.reg_no}`
    p '==============================================='
  end
end
