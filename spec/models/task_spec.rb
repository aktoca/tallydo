require 'spec_helper'

describe Task do 
  before :all do
    @task = Task.new(user_id: 3, doable_id: 2, doable_type: 'Movie')
    @task.save

    @film = Movie.new(id: 2, movie_title: 'There', year:1903, director: 'Ed Ter')
    @user = User.create(id: 3, crypted_password: "$2a$10$BYMPT4j8IYGtUwB2OdrlXeH1YzBfMyko0ZaA9iGxvv/gB4XOl.WmW", email: "mail@mail", salt: "CGEBgx1qcuqppc6ppn9n", username: "User")
  end

  it 'is a Task object' do
    expect(@task).to be_a(Task)
  end

  it 'is valid' do
    expect(@task).to be_valid
  end

  it 'is invalid without a user id' do
    expect(Task.create(doable_id: 1, doable_type: :movie)).to raise_error
     
  end

  it 'has a movie id as doable' do
    expect(@film.tasks.first).to be_a(Task) 
  end

  it 'has a user association' do
    expect(@user.tasks.first).to be_a(Task)
  end

  it 'has a boolean of done/notdone' do
    expect(@task.done).to eq(false)
  end



end 
