require 'spec_helper'

describe "team pages" do 

	subject { page }

	# create_user_league

	let(:user) { FactoryGirl.create(:user) }
  let(:league) { user.leagues.create(name: "example league") }

	describe "when visiting the index" do 
		before do 
			team = league.teams.create(name: "example team" )
			visit league_teams_path(league)
		end

		it { should have_title("Teams") }
		it { should have_content("example team") }
		it { should have_content("example league") }

	end
end