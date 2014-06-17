class MoviesController < ApplicationController
 
 def index 
   @movies = Movie.all
 end 

 def show
   @movie = Movie.find(params[:id])
 end

 private
 def user_params
   params.require(:movie).permit(:movietitle,	:year, :description, :actors, :director, :aka, :imdbid, :poster)
 end
end
