require 'spec_helper'

describe "League" do

	let(:user) { FactoryGirl.create(:user) }

  before do
  	@league = user.leagues.build(name: "example league")
  end

  subject { @league }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do 
  	before { @league.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when name is not present" do 
  	before { @league.name = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do 
  	before { @league.name = "a" * 31 }
  	it { should_not be_valid }
  end

  describe "when name is already taken" do 
  	before do
	  	league_with_same_name = @league.dup
	  	league_with_same_name.save
	  end

	  it { should_not be_valid }
  end

  describe "when name format is invalid" do 
  	it "should be invalid" do 
  		leagues = %w[;cpp; meqan$ sdlkfjgh&]
			leagues.each do |invalid_league|
				@league.name = invalid_league
				expect(@league).not_to be_valid
			end
  	end
  end

  describe "when name format is valid" do 
  	it "should be valid" do 
  		leagues = ["cool league", "cool league 2", "ANOTHER league"]
  		leagues.each do |valid_league|
  			@league.name = valid_league
  			expect(@league).to be_valid
  		end
  	end
  end
end
