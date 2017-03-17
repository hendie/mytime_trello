# MyTime Trello Exercise

This exercise demonstrates a headless RESTful Ruby on Rails application which provides and API to interact with a Trello-like app consisting of Boards that can contain Lists which in turn can contain Cards.

* Ruby version: **2.4.0**
* Rails version **5.0.2**
* System dependencies: **none**
* Configuration: **self contained**
* Database: **sqlite**
* Database creation: `rails db:migrate`
* Database initialization: `rails db:seed`
* How to run the test suite: `bundle exec rspec`
* Deployment instructions: `rails s`

This app is an API-only application, and will respond with JSON to the following calls:

* GET /boards - shallow list of boards (no inner content)
* POST /boards - create a new board
* GET /boards/:id - get a deep content of a board (includes lists and cards)
* PUT /boards/:id - updates a board
* DELETE /boards/:id - delete a board

* GET /boards/:board_id/lists - deep list of lists (include cards)
* POST /boards/:board_id/lists - create a new list
* GET /boards/:board_id/lists/:id - get a deep content of a list (includes cards)
* PUT /boards/:board_id/lists/:id - updates a list
* DELETE /boards/:board_id/lists/:id - delete a list
* 
* GET /boards/:board_id/lists/:list_id/cards - list of cards
* POST /boards/:board_id/lists/:list_id/cards - create a new card
* GET /boards/:board_id/lists//:list_id/cards/:id - get content of a cards
* PUT /boards/:board_id/lists//:list_id/cards/:id - updates a card
* PATCH /boards/:board_id/lists//:list_id/cards/:id/move/:move_id - moves a card to another list in a board
* DELETE /boards/:board_id/lists//:list_id/cards/:id - delete a card
