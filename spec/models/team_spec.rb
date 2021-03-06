require 'spec_helper'

describe Team do

  create_user_league #utilities

  before do 
  	@team = league.teams.build(name: "example team")
  end

  subject { @team }

  it { should respond_to(:name) }
  it { should respond_to(:league_id) }
  it { should respond_to(:league) }
  its(:league) { should eq league }

  it { should be_valid }

  describe "when a league is not present" do 
  	before { @team.league_id = nil }

  	it { should_not be_valid }
  end

  describe "when a name is not present" do 
  	before { @team.name = " " }

  	it { should_not be_valid }
  end

  describe "with a name is too long" do 
  	before { @team.name = "a" * 31 }

  	it { should_not be_valid }
  end

  describe "with an invalid name" do
  	it "should be invalid" do 
  		teams = %w[cpp; meqan$ sdlkfjgh&]
  		teams.each do |invalid_team|
  			@team.name = invalid_team
  			expect(@team).not_to be_valid
  		end
  	end
  end

  describe "with a valid name" do 
  	it "should be valid" do 
  		teams = ["cool team", "cool team 2", "ANOTHER team"]
  		teams.each do |valid_team|
  			@team.name = valid_team
  			expect(@team).to be_valid
  		end
  	end
  end

  describe "when a name is already taken" do 

    describe "with a name from the same league" do
      before do 
        team_with_same_name = @team.dup
        team_with_same_name.save
      end

      it { should_not be_valid }
    end

    describe "with a name from a different league" do 
      before do 
        team_with_same_name = @team.dup
        team_with_same_name.league_id = 2
        team_with_same_name.save
      end

      it { should be_valid }
    end
  end
end
