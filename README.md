Andy's Invasion Game
============


Description
-----------

This is my Invasion game on a rails platform.

Prerequisites
-------------

In order to run Invasion locally, you will need to have a few things installed first.

* ruby 2.3.1
* rails 4.2.2

Setup
-----

Clone the repo from BitBucket.

    $ git clone git@bitbucket.org:Life4ants/invasion-rails.git
    $ cd invasion-rails

Install the gems.

    $ bundle install


Setup the database. (You may need to prepend this with `bundle exec`)

    $ rake db:create

Run the migrations.

    $ rake db:migrate

Edit the database seeds at `config/db/seeds.rb` and edit the info for the admin user.

```

User.create!(name:  "Brother Andy",
             email: "brotherandy@live.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
```

Seed the database. In additon to setting up territory borders and such, this will create 8 sample users (with email addresses stolen from Micheal Hartl - don't tell anyone!)

    $ rake db:seed

Start the webrick server.

    $ rails server

Open your browser to `localhost:3000` and you will get the home page. You can log in with the username and password you chose for the admin user and join the created game from there.