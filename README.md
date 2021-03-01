# oldphp7_vs_laravel7_vs_phoenix1.5.8_vs_phalcon4

I am going to attempt to take a look at 4 ways of serving data

oldphp7 
laravel7 
phoenix1.5.8
phalcon4

Given a Dataset of Employees and Gifts 
What would be the quick ways of showing that data.


# old php 

...for this just go in the folders oldphp/html
and serve employees of gifts 
very basic READ-WRITE-UPDATE-to JSON directly

..for this API I did not get to finish,
but I got an idea of how to keep going 
index.php inside api will receive and 
do the "route" work while 
individual scripts are called from it. 

...maybe another time to finish ..times up

# Laravel7 
...for this just go to the folder laravel7/


edit .env 
create db
su - postgres -c "createdb -O postgres backend_take_home"
migrate
artisan migrate
serve
artisan serve

load sample data
http://127.0.0.1:8000/fill-gifts-table
http://127.0.0.1:8000/fill-employees-table

see the routes
artisan route:list

run tests
artisan test

...these will fail .. need more time to add to it 
more validations and auth validations etc. 



# Phoenix 1.5.8 
...for this just go to folder phonenix158/

do not need run migrations
do not need to create db since it is going to use the laravel7 made one

just do 
to install 
mix deps.get

add some users to table
mix run priv/repo/seeds.exs

then run server
PORT=4000 mix phx.server
iex -S mix phx.server
PORT=4000 iex -S mix phx.server

see the routes
mix phx.routes

test with curl 
curl -H "Content-Type: application/json" -X POST -d '{"email":"user1@email.com","password":"qwerty"}' http://localhost:4000/api/users/sign_in -c cookies.txt -b cookies.txt -i


also run tests
mix test

# Phalcon4

..for this I have no love. I tried to do the micro framework 
and I could not find enought documentation to start

I got to the generic create of the app,
not worth looking at 
but the whole Phalcon/Micro
remains a mistery on how to implement.
Boo Phalcon




In conclusion. 
Seems like Old PHP doind a READ WRITE in HTML looks fast when doing simple stuff. also Very few files
The Phoenix seems more robust in security from the get go and it provides more generators, but is a little harder to understand
The Laravel seems friendlier, but is more insecure and harder to secure. 


Seems like Laravel is good at prototyping as long as it does not need to be secured. There needs to be too many steps to get a safe app.
Phoenix is very secure from the start but is more tedious to addd models and controllers because of that
Plain old pHP, just needs way more steps and a lot of things could fail. I did not even get to the API making, just HTML-PHP

that is it.