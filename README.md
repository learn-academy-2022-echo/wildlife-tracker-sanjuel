# This is where I will store all the commands that I ran to create this wildlife tracker api

# Creating the app

rails new wildlife_tracker -d postgresql -T
bundle add rspec-rails 
rails generate rspec:install 
rails db:create 
rails db:migrate       

# Generating the model and routes with resource

rails g resource Animal name:string sci_name:string

# Routes for the API
       animals GET    /animals(.:format)              animals#index
               POST   /animals(.:format)              animals#create
    new_animal GET    /animals/new(.:format)          animals#new
   edit_animal GET    /animals/:id/edit(.:format)     animals#edit
        animal GET    /animals/:id(.:format)          animals#show
               PATCH  /animals/:id(.:format)          animals#update
               PUT    /animals/:id(.:format)          animals#update
               DELETE /animals/:id(.:format)          animals#destroy

# STORY 1

# Acceptance Criteria for Story 1

1. Create a resource for animal with the following information: common name and scientific binomial

 $ rails g resource Animal name:string sci_name:string

2. Can see the data response of all the animals
 
   See animals_controller def index
 
3. Can create a new animal in the database
use create for this 

 see animals_controller def create

4. Can update an existing animal in the database
use update for this(patch)

See animals_controller def update

5. Can remove an animal entry in the database
use destroy for this

see animals_controller def destroy

# STORY 2

# Routes for Sightings

      sightings GET    /sightings(.:format)  sightings#index
                POST   /sightings(.:format)  sightings#create
   new_sighting GET    /sightings/new(.:format)            sightings#new
  edit_sighting GET    /sightings/:id/edit(.:format)       sightings#edit
       sighting GET    /sightings/:id(.:format)            sightings#show
                PATCH  /sightings/:id(.:format)            sightings#update
                PUT    /sightings/:id(.:format)            sightings#update
                DELETE /sightings/:id(.:format)            sightings#destroy

# Acceptance Criteria for Story 2

1. Create a resource for animal sightings with the following information: latitude, longitude, date
        Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)
        Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28")

        $ rails g resource Sighting animal_id:integer latitude:string longitude:string date:date

2. Can create a new animal sighting in the database

 # In terminal 

 $ dog = Animal.find 1
 $ dog.sightings.create longitude:'36.7783° N', latitude:'119.4179° W', date:"2022-07-28"


3. Can update an existing animal sighting in the database

# In Postman
 PATCH localhost:3000/sightings/1
 {
        "id": 1,
        "animal_id": 1,
        "latitude": "119.4179° W",
        "longitude": "36.7783° N",
        "date": "2022-12-25",
        "created_at": "2022-09-09T18:09:30.819Z",
        "updated_at": "2022-09-09T18:09:30.819Z"
    }

4. Can remove an animal sighting in the database

# In postman

DELETE localhost:3000/sightings/1
        # 1 Refers to the id of the sighting I want to delete

# STORY 3

# Acceptance Criteria for Story 3

1. Can see one animal with all its associated sightings

To do this, I went into my animals_controller.rb file and added 
 include: [:sightings]
to the show method. This way when we take one animal we also see all of the sightings assosiated with the animals id. 

2. Can see all the all sightings during a given time period
        Hint: Your controller can use a range to look like this:

class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end

        Hint: Be sure to add the start_date and end_date to what is permitted in your strong parameters method
        Hint: Utilize the params section in Postman to ease the developer experience

# IN PostMan

In the query params put exactly what is in your params. In this case in keys it was start_date and end_date

so it ends up looking like

start_date 2022-01-01

end_date 2022-12-25

and that comes up with all the sightings between that timeframe

