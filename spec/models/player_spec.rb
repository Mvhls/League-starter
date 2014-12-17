require 'spec_helper'

describe "Player" do

	let(:user) { FactoryGirl.create(:user) }
	let(:league) { user.leagues.create(name: "example league", user_id: user.id) }

  before do
  	@player = Player.create(user_id: user.id, league_id: league.id)
  end

  subject { @player }

  it { should respond_to(:user_id) }
  it { should respond_to(:league_id) }
  it { should respond_to(:name) }

  describe "when searching for the players name" do 
  	subject { @player.name }

  	it { should eq(user.name) }
  end

  describe "when creating a player" do 
    before { @new_player = Player.create }
    subject { @new_player }

    describe "when making a player without a user id" do 
      before { @new_player.update_attributes(league_id: league.id) }
      it { should be_valid }
    end

    describe "when creating a player without a league id" do 

      it { should_not be_valid }
    end
  end


end
