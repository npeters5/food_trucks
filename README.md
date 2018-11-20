##About this project

This project is a CLI that queries this Socrata data source API to get information about currently open food trucks in the San Francisco area: https://dev.socrata.com/foundry/data.sfgov.org/bbb8-hzi6. This project relies on the 'table-print' gem for displaying data in table-like fashion in the Terminal, and uses the 'soda/client' gem which allows us to query the API endpoint using SoQL parameters to filter and manipulate a dataset and return it as json.

##How to get it up and running on your local environment

1.  Fork and clone this repository
2.  `cd` into the directory
3.  Run `bundle install` to install dependencies
4.  Optional: replace the existing TOKEN in food_trucks.rb with a new one, from: https://data.sfgov.org/
5.  Run `./bin/food_trucks` from command line to start the program, then follow prompts

##Thoughts on extending to full-scale web application

If I were to build this as a full-scale web application, I would approach the design and implementation quite differently, however the underlying business logic and API wrapper would be quite the same. In addition to thinking more about the end user and making the GUI look attractive and intuitive, I'd think about using an MVC framework like Ruby on Rails, because it can be used to stand up a whole application pretty quickly. I would focus on making the views render properly in the browser (styling them in a user-friendly, responsive, mobile-first way), using my routes and controller to handle/alert user to more errant or malicious input, and perhaps build an object model of food trucks that I could cache in a database to reduce the number of calls made to the API. ReactJS and Redux would also be a good option, since managing state is a central feature of those libraries. Since web apps tend to be more robust, I would also consider future additional features or functionality might be added and try to design more for extendability. The FoodTruckAPIWrapper class would also have to change by returning data that is then rendered by my views, instead of using 'puts' or table-printing them to the console.
