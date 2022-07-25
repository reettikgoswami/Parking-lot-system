require_relative 'lib/parking_system'

parking_system = ParkingSystem.new(10)

parking_system.park('reg-1', 'Red')
parking_system.park('reg-2', 'White')
parking_system.park('reg-3', 'Black')
parking_system.park('reg-4', 'Gray')
parking_system.park('reg-5', 'Red')
parking_system.park('reg-6', 'Red')
parking_system.park('reg-7', 'Yellow')
parking_system.park('reg-8', 'Red')
parking_system.park('reg-9', 'Red')
parking_system.park('reg-10', 'Yellow')
# parking_system.park('reg-11', 'Red')

parking_ticket = parking_system.find_parking_ticket_by_registration_number('reg-4')
# parking_system.find_parking_ticket_by_registration_number("reg-78")

parking_system.leave(parking_ticket.id)
# parking_system.park('reg-11', 'Red')

# parking_system.find_registration_numbers_by_color("Red")

# parking_system.find_tickets_by_color("Red")

parking_system.show_parking_lot
