require 'spec_helper'

describe Movie do 
  before :each do
    @title_only =  Movie.new(movie_title: 'The Great Train Robbery')
    @needed_only = Movie.new(movie_title: 'The Great Train Robbery', year:1903, director: 'Edwin S. Porter')
  end
  it "is invalid without a title" do 
    expect(Movie.new(movie_title: nil, year: 2001, director: 'John Doe')).to_not be_valid 
  end
  it "is invalid without a year, director" do 
    expect(@title_only).to_not be_valid 
  end
  it "is valid without a description b/c it creates a default" do 
   expect(@needed_only[:description]).to eq('Not avaliable')
  end
  it "is valid without actor, aka_title, imdb_id, or poster" do 
    expect(@needed_only).to be_valid 
  end

end 
