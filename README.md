# README

## talk-talk
Talk talk is a simple messaging api that does the following
* You can create new messages between a sender and a recipient
* You can get the past 100 messages between a sender and a recipient
* You can get the past 100 messages for all senders for a specific recipient


## Setup
If you are familar with rails dev environments hopefully this is familar to you
* First start by running `bundle install` to get the depdencies
* Run a `rake db:setup && rake db:migrate` to get your db setup
* This app uses postgres so make sure that is running first
* Run a `rails s` to get the api up an running
* If you want to seed the db with some sample data `rake db:seed`
* To run specs run `bundle exec rspec spec`

## If I had more time....
* Sad path testing for specs
* Missing a validation for users not being able to send messages to themselves
* Need db indexes on `recipient_id`, `sender_id`, and a combined index for searching on both fields
* DB model isn't super flexible, it would have been nice to support something like group messaging from the start

* Thanks for taking a look at this repo! :)

## API

* **URL**
  `api/v1/messages`

* **Method:**
  `POST`

* **Data Params**
  **required**
  `{text: 'An example message between friends', sender_id: '1', recipient_id: '2'}`


* **Success Response:**
  `201`


* **Error Response:**
  `422`

* **Response Body**
  `The created message in JSON if created successfully`


---------------------------------------------------------------


* **URL**
  `api/v1/messages`

* **Method:**
  `GET`

*  **URL Params**

   **Required:**

   `recipient_id=[integer]`
   `passing in only recipient id will give you the last 100 messages for a recipient`

   **Optional**

   `Passing in the sender id will retrieve the last 100 message between a recipient and a sender`
   `sender_id=[integer]`


* **Success Response:**
  `200`


* **Error Response:**
  `400`

* **Response Body**
  `[{"id":1,"text":"hi honey hillary","recipient_id":2,"sender_id":1,"created_at":"2021-08-25T19:45:36.325Z","updated_at":"2021-08-25T19:45:36.325Z"},{"id":78,"text":"reintermediate front-end channels","recipient_id":2,"sender_id":30,"created_at":"2021-08-27T01:33:42.427Z","updated_at":"2021-08-27T01:33:42.427Z"},{"id":129,"text":"optimize killer models","recipient_id":2,"sender_id":36,"created_at":"2021-08-27T01:33:42.869Z","updated_at":"2021-08-27T01:33:42.869Z"},{"id":135,"text":"evolve ubiquitous ROI","recipient_id":2,"sender_id":4,"created_at":"2021-08-27T01:33:42.921Z","updated_at":"2021-08-27T01:33:42.921Z"},{"id":187,"text":"integrate distributed interfaces","recipient_id":2,"sender_id":32,"created_at":"2021-08-27T01:33:43.354Z","updated_at":"2021-08-27T01:33:43.354Z"},{"id":223,"text":"generate customized e-markets","recipient_id":2,"sender_id":3,"created_at":"2021-08-27T01:33:43.657Z","updated_at":"2021-08-27T01:33:43.657Z"},{"id":248,"text":"leverage cutting-edge experiences","recipient_id":2,"sender_id":32,"created_at":"2021-08-27T01:33:43.874Z","updated_at":"2021-08-27T01:33:43.874Z"},{"id":285,"text":"deliver rich schemas","recipient_id":2,"sender_id":19,"created_at":"2021-08-27T01:33:44.185Z","updated_at":"2021-08-27T01:33:44.185Z"},{"id":308,"text":"streamline efficient solutions","recipient_id":2,"sender_id":13,"created_at":"2021-08-27T01:33:44.393Z","updated_at":"2021-08-27T01:33:44.393Z"},{"id":359,"text":"synthesize value-added convergence","recipient_id":2,"sender_id":12,"created_at":"2021-08-27T01:33:44.816Z","updated_at":"2021-08-27T01:33:44.816Z"},{"id":507,"text":"disintermediate B2C deliverables","recipient_id":2,"sender_id":30,"created_at":"2021-08-27T01:33:46.116Z","updated_at":"2021-08-27T01:33:46.116Z"},{"id":515,"text":"transition cross-platform paradigms","recipient_id":2,"sender_id":33,"created_at":"2021-08-27T01:33:46.187Z","updated_at":"2021-08-27T01:33:46.187Z"},{"id":516,"text":"engineer killer web-readiness","recipient_id":2,"sender_id":12,"created_at":"2021-08-27T01:33:46.196Z","updated_at":"2021-08-27T01:33:46.196Z"},{"id":529,"text":"brand impactful infomediaries","recipient_id":2,"sender_id":14,"created_at":"2021-08-27T01:33:46.302Z","updated_at":"2021-08-27T01:33:46.302Z"},{"id":530,"text":"extend revolutionary experiences","recipient_id":2,"sender_id":37,"created_at":"2021-08-27T01:33:46.311Z","updated_at":"2021-08-27T01:33:46.311Z"},{"id":695,"text":"enable interactive systems","recipient_id":2,"sender_id":37,"created_at":"2021-08-27T01:35:36.035Z","updated_at":"2021-08-27T01:35:36.035Z"},{"id":833,"text":"transition robust architectures","recipient_id":2,"sender_id":82,"created_at":"2021-08-27T01:35:37.263Z","updated_at":"2021-08-27T01:35:37.263Z"},{"id":869,"text":"seize revolutionary e-commerce","recipient_id":2,"sender_id":80,"created_at":"2021-08-27T01:35:37.585Z","updated_at":"2021-08-27T01:35:37.585Z"},{"id":1045,"text":"enable best-of-breed deliverables","recipient_id":2,"sender_id":102,"created_at":"2021-08-27T01:35:39.143Z","updated_at":"2021-08-27T01:35:39.143Z"}]`
