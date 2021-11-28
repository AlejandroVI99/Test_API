# README
# Restaurants API
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Heroku app: https://test-restaurants-api-2021.herokuapp.com/api/v1/restaurants/

* Heroku statistics link: https://test-restaurants-api-2021.herokuapp.com/api/v1/statistics?latitude=19.437768497719&longitude=-99.1286486584673&z=0.0005

* Ruby version 3.0.1

* How to run the test suite
  
  To run correctly the statistics operations, you need to give a float value to the 'z' parameter, how it is show in the picture, 0.0005 are 5 meters
![Screenshot from 2021-11-27 18-27-29](https://user-images.githubusercontent.com/57637591/143724408-d74d31a7-cf5e-4412-a149-77149029b971.png)



Task 1

The first task consists in importing the raw data into a relational database and exposing a REST API that implements CRUD (Create, Read, Update, Delete) operations.

The Restaurants table needs to have the following schema:

    Restaurants (

            id TEXT PRIMARY KEY, -- Unique Identifier of Restaurant

            rating INTEGER, -- Number between 0 and 4

            name TEXT, -- Name of the restaurant

            site TEXT, -- Url of the restaurant

            email TEXT,

            phone TEXT,

            street TEXT,

            city TEXT,

            state TEXT,

            lat FLOAT, -- Latitude

            lng FLOAT) -- Longitude
            
Task 2

The second task consists in implementing the following endpoint:

/restaurants/statistics?latitude=x&longitude=y&radius=z

It receives a latitude and a longitude as parameters, which correspond to the center of a circle, and a third parameter that corresponds to a radius in METERS.

* Hint: A tool like PostGIS or equivalent may help you with the spatial queries ;)

 

This endpoint needs to return a JSON with the following data:

{

        	count: Count of restaurants that fall inside the circle with center [x,y] and radius z,

        	avg: Average rating of restaurant inside the circle,

        	std: Standard deviation of rating of restaurants inside the circle

}

References

https://gist.github.com/arjunvenkat/1115bc41bf395a162084 import data of an csv to database

https://andycroll.com/ruby/calculate-the-standard-deviation-of-a-ruby-array/ statistics operations

https://www.youtube.com/watch?v=taIj7X34DZU Points Inside Outside On a Circle - Visualizing Algebra
