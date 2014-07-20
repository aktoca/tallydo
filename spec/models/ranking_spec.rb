require 'spec_helper'

describe Ranking do
  before :all do
    @ranking = Ranking.new(list_id: 2, doable_id: 3, doable_type: 'Movie', rank: 1)
    @ranking.save
    @film = Movie.find(3)
    @list = List.create(id: 2, name: "1001", year: 2005, creator: "A Guy")

  end

  it 'is a Ranking object' do
    expect(@ranking).to be_a(Ranking)
  end

  it 'is valid' do
    expect(@ranking).to be_valid
  end

  it 'is invalid without a list id' do
    expect(Ranking.create(doable_id: 3, doable_type: :movie)).to be_a(Ranking) 
     
  end

  it 'has a movie id as doable' do
    expect(@film.rankings.first).to be_a(Ranking) 
  end

  it 'has a list association' do
    expect(@list.rankings.first).to be_a(Ranking)
  end



end
