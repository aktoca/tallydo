require 'spec_helper'

describe MoviesController do
  it 'should return all records' do
    get :index
    expect(assigns[:movies]).to eq([])
  end
  it 'should show a single record' do
    get :show, id: 1
    expect(assigns[:movies]).to eq(a)
  end
end
