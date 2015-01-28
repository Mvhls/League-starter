require 'spec_helper'


describe StatType do

	create_user_league
	let(:team) { league.teams.create(name: "example team") }
	let(:player) { team.players.create(name: "example player",
																		 user_id: user.id,
																		 league_id: league.id) }

  before do
  	@stat_type = league.stat_types.build(name: "example stat")
  end

  subject { @stat_type }

  it { should respond_to(:name) }
  it { should respond_to(:league_id) }

  it { should be_valid }

  describe "when a name is not present" do
  	before { @stat_type.name = " " }

  	it { should_not be_valid }
  end

  describe "when a name is too long" do
  	before { @stat_type.name = "a" * 31 }

  	it { should_not be_valid }
  end

  describe "with an invalid name" do
  	it "should be invalid" do
  		stat = %w[cpp; meqan$ sdlkfjgh&]
  		stat.each do |invalid_stat|
  			@stat_type.name = invalid_stat
  			expect(@stat_type).not_to be_valid
  		end
  	end
  end

  describe "with a valid name" do
  	it "should be valid" do
  		stats = ["cool team", "cool team 2", "ANOTHER team"]
  		stats.each do |valid_stat|
  			@stat_type.name = valid_stat
  			expect(@stat_type).to be_valid
  		end
  	end
  end

  describe "when a name is already taken" do
  	before do
	  	stat_type_with_same_name = @stat_type.dup
	  	stat_type_with_same_name.save
		end

		it { should_not be_valid }
  end
end