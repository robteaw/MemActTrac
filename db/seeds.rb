# Records are deleted and the auto-generated primary keys are overridden
# The reason for this is mostly because of data importing issues.  In
# order to properly import data, certain foreign keys have to be expected,
# so they have been hardcoded into the seed file.

#rollback flag

Location.create(id: 1, name: "Cypress")
Location.create(id: 2, name: "Lake Houston")
Location.create(id: 3, name: "Tyler")

Call.update_all(location_id: 1)
ClassAttendance.update_all(location_id: 1)
ClassTime.update_all(location_id: 1)
Employee.update_all(location_id: 1)
Member.update_all(location_id: 1)
MembershipType.update_all(location_id: 1)
Prospect.update_all(location_id: 1)

# Call.delete_all
# Prospect.delete_all
# Member.delete_all
# ClassAttendance.delete_all
# ClassTime.delete_all
# Employee.delete_all
# MembershipType.delete_all
#
# membership_type = MembershipType.create([
#   {id: 1, membership_type: '12 Month'},
#   {id: 2, membership_type: '7 Month'},
#   {id: 3, membership_type: '65 Class Card'},
#   {id: 4, membership_type: '35 Class Card'},
#   {id: 5, membership_type: '10 Class Groupon'},
#   {id: 6, membership_type: '4 Class Groupon'},
#   {id: 7, membership_type: '5 Class Web Special'},
#   {id: 8, membership_type: '3 Class Web Special'}
# ])
#
#
# employee = Employee.create([
#     {id: 1, fname: 'Paige', lname: 'Gallemore'},
#     {id: 2, fname: 'Ian', lname: 'Moore'},
#     {id: 3, fname: 'Will', lname: 'Bethea'},
#     {id: 4, fname: 'Zee', lname: 'Roberts'},
#     {id: 5, fname: 'Amber', lname: 'Isaac'},
#     {id: 6, fname: 'Meeka', lname: 'Karger'},
#     {id: 999, fname: 'TBD', lname: 'TBD'}
# ])
#
#
# class_time = ClassTime.create([
# {id: 1, day_of_week: 'Monday', start_time: '5:30 AM'},
# {id: 2, day_of_week: 'Monday', start_time: '8:00 AM'},
# {id: 3, day_of_week: 'Monday', start_time: '10:00 AM'},
# {id: 4, day_of_week: 'Monday', start_time: '5:00 PM'},
# {id: 5, day_of_week: 'Monday', start_time: '6:15 PM'},
# {id: 6, day_of_week: 'Monday', start_time: '7:30 PM'},
# {id: 7, day_of_week: 'Tuesday', start_time: '6:15 AM'},
# {id: 8, day_of_week: 'Tuesday', start_time: '8:30 AM'},
# {id: 9, day_of_week: 'Tuesday', start_time: '10:15 AM'},
# {id: 10, day_of_week: 'Tuesday', start_time: '5:15 PM'},
# {id: 11, day_of_week: 'Tuesday', start_time: '6:30 PM'},
# {id: 12, day_of_week: 'Tuesday', start_time: '7:45 PM'},
# {id: 13, day_of_week: 'Wednesday', start_time: '5:30 AM'},
# {id: 14, day_of_week: 'Wednesday', start_time: '8:00 AM'},
# {id: 15, day_of_week: 'Wednesday', start_time: '10:00 AM'},
# {id: 16, day_of_week: 'Wednesday', start_time: '5:00 PM'},
# {id: 17, day_of_week: 'Wednesday', start_time: '6:15 PM'},
# {id: 18, day_of_week: 'Wednesday', start_time: '7:30 PM'},
# {id: 19, day_of_week: 'Thursday', start_time: '6:15 AM'},
# {id: 20, day_of_week: 'Thursday', start_time: '8:30 AM'},
# {id: 21, day_of_week: 'Thursday', start_time: '10:15 AM'},
# {id: 22, day_of_week: 'Thursday', start_time: '5:15 PM'},
# {id: 23, day_of_week: 'Thursday', start_time: '6:30 PM'},
# {id: 24, day_of_week: 'Thursday', start_time: '7:45 PM'},
# {id: 25, day_of_week: 'Friday', start_time: '5:30 AM'},
# {id: 26, day_of_week: 'Friday', start_time: '8:00 AM'},
# {id: 27, day_of_week: 'Friday', start_time: '10:00 AM'},
# {id: 28, day_of_week: 'Friday', start_time: '5:15 PM'},
# {id: 29, day_of_week: 'Friday', start_time: '6:30 PM'},
# {id: 30, day_of_week: 'Saturday', start_time: '9:00 AM'},
# {id: 31, day_of_week: 'Saturday', start_time: '10:15 AM'},
# {id: 32, day_of_week: 'Saturday', start_time: '11:30 AM'}
# ])
#
#
# class_attendances = ClassAttendance.create([
# {id: 1,     class_time_id: 7,     date: '5/1/2018',     attendance: 8},
# {id: 2,     class_time_id: 8,     date: '5/1/2018',     attendance: 8},
# {id: 3,     class_time_id: 9,     date: '5/1/2018',     attendance: 12},
# {id: 4,     class_time_id: 10,    date: '5/1/2018',     attendance: 15},
# {id: 5,     class_time_id: 11,    date: '5/1/2018',     attendance: 9},
# {id: 6,     class_time_id: 12,    date: '5/1/2018',     attendance: 11},
# {id: 7,     class_time_id: 13,    date: '5/2/2018',     attendance: 3},
# {id: 8,     class_time_id: 14,    date: '5/2/2018',     attendance: 18},
# {id: 9,     class_time_id: 15,    date: '5/2/2018',     attendance: 5},
# {id: 10,    class_time_id: 16,    date: '5/2/2018',     attendance: 14},
# {id: 11,    class_time_id: 17,    date: '5/2/2018',     attendance: 12},
# {id: 12,    class_time_id: 18,    date: '5/2/2018',     attendance: 15},
# {id: 13,    class_time_id: 19,    date: '5/3/2018',     attendance: 12},
# {id: 14,    class_time_id: 20,    date: '5/3/2018',     attendance: 13},
# {id: 15,    class_time_id: 21,    date: '5/3/2018',     attendance: 12},
# {id: 16,    class_time_id: 22,    date: '5/3/2018',     attendance: 14},
# {id: 17,    class_time_id: 23,    date: '5/3/2018',     attendance: 18},
# {id: 18,    class_time_id: 24,    date: '5/3/2018',     attendance: 16},
# {id: 19,    class_time_id: 25,    date: '5/4/2018',     attendance: 14},
# {id: 20,    class_time_id: 26,    date: '5/4/2018',     attendance: 6},
# {id: 21,    class_time_id: 27,    date: '5/4/2018',     attendance: 12},
# {id: 22,    class_time_id: 28,    date: '5/4/2018',     attendance: 13},
# {id: 23,    class_time_id: 29,    date: '5/4/2018',     attendance: 12},
# {id: 24,    class_time_id: 30,    date: '5/5/2018',     attendance: 11},
# {id: 25,    class_time_id: 31,    date: '5/5/2018',     attendance: 18},
# {id: 26,    class_time_id: 32,    date: '5/5/2018',     attendance: 19},
# {id: 27,    class_time_id: 1,     date: '5/7/2018',     attendance: 12},
# {id: 28,    class_time_id: 2,     date: '5/7/2018',     attendance: 12},
# {id: 29,    class_time_id: 3,     date: '5/7/2018',     attendance: 15},
# {id: 30,    class_time_id: 4,     date: '5/7/2018',     attendance: 13},
# {id: 31,    class_time_id: 5,     date: '5/7/2018',     attendance: 11},
# {id: 32,    class_time_id: 6,     date: '5/7/2018',     attendance: 6}
#                                            ])
#
# propsects = Prospect.create([
#     {id: 1, fname: 'Joe', lname: 'Meyers', showed: 0, signed_up: 0, scheduled_date: '7/2/2018', membership_type_id: 8, class_time_id: 3},
#     {id: 2, fname: 'Moe', lname: 'Syzlack', showed: 0, signed_up: 0, scheduled_date: '9/10/2018', membership_type_id: 8, class_time_id: 3},
#     {id: 3, fname: 'Brandaline', lname: 'JoJohnson', showed: 0, signed_up: 0, scheduled_date: '9/12/2018', membership_type_id: 8, class_time_id: 15},
#     {id: 4, fname: 'Heather', lname: 'Leather', showed: 0, signed_up: 0, scheduled_date: '9/13/2018', membership_type_id: 8, class_time_id: 24}
#                   ])