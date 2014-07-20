# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 movies =[ 
             {
  movie_title: "A Trip to the Moon",
  aka_title:"Le Voyage Dans La Lune",
  year: 1902,
  director: "Georges Méliès",
  imdbid:'tt0000417'
}, {
  movie_title: "The Great Train Robbery",
  year: 1903,
  director: "Edwin S. Porter",
  imdbid:'tt0000439'
}]

movies.each do |movie|
  Movie.create(movie)
end

