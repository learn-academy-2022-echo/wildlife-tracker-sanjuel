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

# Acceptance Criteria

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