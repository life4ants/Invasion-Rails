Andy's Invasion Game
============


Description
-----------

This is my Invasion game on a rails platform. If finished, players can create games, and join games other users have created. The board will be updated during play using websockets.

Prerequisites
-------------

In order to run Invasion locally, you will need to have a few things installed first.

* ruby 2.3.1
* rails 5.0.0

Setup
-----

Clone the repo.

    $ git clone git@github.com:life4ants/Invasion-Rails.git
    $ cd Invasion-Rails

Install the gems.

    $ bundle install


Setup the database. (You may need to prepend this with `bundle exec`)

    $ rake db:create

Run the migrations.

    $ rake db:migrate


Seed the database. In additon to setting up territory borders and such, this will create 8 sample users

    $ rake db:seed

Start the webrick server.

    $ rails server

Open your browser to `localhost:3000` and you will get the home page. You can log in with an email and password for any of the users created in `db/seeds.rb`.