require 'active_support'

require_relative 'utilities'
require_relative 'parking_lot'
require_relative 'car'
require_relative 'ticket'

class ParkingSystem
  include Utilities
  attr_reader :parking_lot

  def initialize(total_parking_space)
    @parking_lot = ParkingLot.new(total_parking_space)
    @track_tickets = {}
  end

  def park(reg_no, color)
    available_slot = @parking_lot.find_available_slot
    if available_slot.nil?
      p 'Parking lot is full.'
    else
      car = Car.new(reg_no, color)
      parking_ticket = Ticket.new(car, available_slot, generate_unique_ticket_id)
      parking_lot.allot_parking_space(parking_ticket, available_slot)
      @track_tickets[parking_ticket.id] = parking_ticket
      print_parking_recite(parking_ticket)
    end
  end

  def leave(parking_ticket_id)
    parking_ticket = @track_tickets[parking_ticket_id]
    unless parking_ticket.present?
      p 'Invalid parking ticket!'
      return
    end
    @track_tickets.delete(parking_ticket_id)
    parking_spot = parking_ticket.parking_spot
    @parking_lot.leave_parking_space(parking_spot)
    p "Slot number #{parking_spot + 1} is free"
  end

  def find_registration_numbers_by_color(color)
    registration_numbers = parking_lot.filter_car_by_color(color)
    registration_numbers.each do |reg_no|
      p reg_no
    end
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
      parking_ticket
    else
      p 'Parking ticket not found!'
    end
  end

  def show_parking_lot
    display_parking_lot(@parking_lot)
  end

  private

  def generate_unique_ticket_id
    parking_ticket = loop do
      ticket_token = generate_parking_ticket_id
      break ticket_token unless @track_tickets.key?(ticket_token)
    end
  end
end
