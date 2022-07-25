require 'terminal-table'

module Utilities
  def generate_parking_ticket_id
    'tic-' + SecureRandom.hex(6)
  end

  def print_parking_recite(parking_ticket)
    headings = [
      'Parking slot',
      'Parking ticket',
      'Registration number',
    ]
    row = [[parking_ticket.parking_spot + 1, parking_ticket.id, parking_ticket.car.reg_no]]
    display_table(headings, row)
  end

  def display_parking_lot(parking_lot)
    table_row = []
    parking_lot.slots.each_with_index do |ticket, parking_spot|
      row = []
      row << parking_spot
      unless ticket.nil?
        row << ticket.id
        row << ticket.car.reg_no
        row << ticket.date
        row << ticket.car.color
      end
      table_row << row
    end
    headings = [
      'Parking slot',
      'Parking ticket',
      'Registration number',
      'Arrival time',
      'Car color'
    ]
    display_table(headings, table_row)
  end

  def display_table(headings, rows)
    puts Terminal::Table.new(
      headings: headings,
      rows: rows,
      style: {
        all_separators: true
      }
    )
  end
end
