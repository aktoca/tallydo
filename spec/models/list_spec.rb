require 'spec_helper'

describe List do
  before :each do
    @nocreator = List.new(name: "1001 movies to see before you die", year: 2000,)
    @sansname = List.new( year: 2000, creator: 'AFI', ongoing: true)
    @sansongoing = List.new(name: "100 yrs 100 Lols", year: 2000, creator: 'AFI')
    @sansyear = List.new(name: "Best Picture", ongoing: true, creator:'AMPS')
    @all = List.new(name: "Best Picture", ongoing: true, creator:'AMPS')


  end

  it "is invalid without a name" do
      expect(@sansname.save).not_to be_persisted
            expect(@sansname.errors[:name]).to include("NotNullViolation")
  end
    
  it "is invalid without a creator" do
    expect(@nocreator.save).to_not be_valid 


  end
  it "has an 'ongoin' defalt value of false" do
    expect(@sansongoing).to be_valid
    expect(@sansongoing.ongoing).to eql(false)
  end

it "is valid with all values and with out a year " do
    expect(@all).to be_valid
     expect(@sansyear).to be_valid 
end


end
