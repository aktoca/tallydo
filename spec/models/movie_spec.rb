require 'spec_helper'

describe Movie do 
  before :each do
    @title_only =  Movie.new(movie_title: 'The Great Train Robbery')
    @needed_only = Movie.new(movie_title: 'The Great Train Robbery', year:1903, director: 'Edwin S. Porter', description:'This is a movie')
  end
  it "is invalid without a title" do 
    Movie.new(movie_title: nil, year: 2001, director: 'John Doe').should_not be_valid 
  end
  it "is invalid without a year, director, or description" do 
    @title_only.should_not be_valid 
  end
  it "is valid without actor, aka_title, imdb_id, or poster" do 
    @needed_only.should be_valid 
  end
end 
