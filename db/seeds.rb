# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

board1 = Board.create(title: 'Board 1')
board2 = Board.create(title: 'Board 2')
board3 = Board.create(title: 'Board 3')

list1_1 = List.create(name: 'List 1 1', board: board1)
list1_2 = List.create(name: 'List 1 2', board: board1)
list1_3 = List.create(name: 'List 1 3', board: board1)

list2_1 = List.create(name: 'List 2 1', board: board2)
list2_2 = List.create(name: 'List 2 2', board: board2)
list2_3 = List.create(name: 'List 2 3', board: board2)
list2_4 = List.create(name: 'List 2 4', board: board2)

list3_1 = List.create(name: 'List 3 1', board: board3)
list3_2 = List.create(name: 'List 3 2', board: board3)

Card.create(title: 'First Task',       list: list1_1)
Card.create(title: 'Second Task',      list: list1_1)

Card.create(title: 'Third Task',       list: list1_2)
Card.create(title: 'Fourth Task',      list: list1_2)
Card.create(title: 'Fifth Task',       list: list1_2)

Card.create(title: 'Sixth Task',       list: list1_3)

Card.create(title: 'Seventh Task',     list: list2_1)
Card.create(title: 'Eighth Task',      list: list2_1)
Card.create(title: 'Ninth Task',       list: list2_1)

Card.create(title: 'Tenth Task',       list: list2_2)
Card.create(title: 'Eleventh Task',    list: list2_2)

Card.create(title: 'Twelfth Task',     list: list2_3)

Card.create(title: 'Thirteenth Task',  list: list3_1)
Card.create(title: 'Fourteenth Task',  list: list3_1)
Card.create(title: 'Fifteenth Task',   list: list3_1)
Card.create(title: 'Sixteenth Task',   list: list3_1)
Card.create(title: 'Seventeenth Task', list: list3_1)

Card.create(title: 'Eighteenth Task',  list: list3_2)
