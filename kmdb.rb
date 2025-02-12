# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all;
Studio.destroy_all;
Actor.destroy_all;
Role.destroy_all;

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
studio = Studio.new
studio["name"] = "Warner Bros"
studio.save

warner= Studio.find_by({"name" => "Warner Bros"})

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["rate"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008
movie["rate"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["rate"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

batman=Movie.find_by({"title" => "Batman Begins"})
dk=Movie.find_by({"title" => "The Dark Knight"})
dkr=Movie.find_by({"title" => "The Dark Knight Rises"})


bale = Actor.new
bale["name"] = "Christian Bale"
bale.save

caine = Actor.new
caine["name"] = "Michael Caine"
caine.save

neeson = Actor.new
neeson["name"] = "Liam Neeson"
neeson.save

holmes = Actor.new
holmes["name"] = "Katie Holmes"
holmes.save

oldman = Actor.new
oldman["name"] = "Gary Oldman"
oldman.save


ledger = Actor.new
ledger["name"] = "Heath Ledger"
ledger.save

eckhart = Actor.new
eckhart["name"] = "Aaron Eckhart"
eckhart.save

gyllenhaal = Actor.new
gyllenhaal["name"] = "Maggie Gyllenhaal"
gyllenhaal.save

hardy = Actor.new
hardy["name"] = "Tom Hardy"
hardy.save

levitt = Actor.new
levitt["name"] = "Joseph Gordon-Levitt"
levitt.save

hathaway = Actor.new
hathaway["name"] = "Anne Hathaway"
hathaway.save

role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = caine["id"]
role["character"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = caine["id"]
role["character"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = neeson["id"]
role["character"] = "Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = holmes["id"]
role["character"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = batman["id"]
role["actor_id"] = oldman["id"]
role["character"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = dk["id"]
role["actor_id"] = bale["id"]
role["character"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = dk["id"]
role["actor_id"] = ledger["id"]
role["character"] = "Joker"
role.save

role = Role.new
role["movie_id"] = dk["id"]
role["actor_id"] = eckhart["id"]
role["character"] = "Harvey Dent"
role.save

role = Role.new
role["movie_id"] = dk["id"]
role["actor_id"] = caine["id"]
role["character"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = dk["id"]
role["actor_id"] = gyllenhaal["id"]
role["character"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = dkr["id"]
role["actor_id"] = bale["id"]
role["character"] = "Bruce Wayne"
role.save


role = Role.new
role["movie_id"] = dkr["id"]
role["actor_id"] = oldman["id"]
role["character"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = dkr["id"]
role["actor_id"] = hardy["id"]
role["character"] = "Bane"
role.save

role = Role.new
role["movie_id"] = dkr["id"]
role["actor_id"] = levitt["id"]
role["character"] = "John Blake"
role.save

role = Role.new
role["movie_id"] = dkr["id"]
role["actor_id"] = hathaway["id"]
role["character"] = "Selina Kyle"
role.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
allmovies=Movie.all
for movie in allmovies
    title=movie["title"]
    year=movie["year_released"].to_s
    rate=movie["rate"]
    producer=Studio.find_by({"id" => movie["studio_id"]})
    printf "- %-30s %4s %-8s %-20s\n", title, year, rate, producer["name"]
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
allroles=Role.all
for role in allroles
    movie=Movie.find_by({"id" => role["movie_id"]})
    actor=Actor.find_by({"id" => role["actor_id"]})
    character=role["character"]
    printf "- %-25s %-25s %-20s\n", movie["title"], actor["name"], character
end
