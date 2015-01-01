require 'spec_helper'

describe "team pages" do 

	subject { page }

	create_user_league
	let(:team) { league.teams.create(name: "exmaple league 2")}

	describe "when visiting the index" do 
		before do 
			league.teams.create(name: "example team")
			visit league_teams_path(league)
		end

		it { should have_title("Teams") }
		it { should have_content("example team") }
		it { should have_content("example league") }

	end

	describe "when visiting the team page" do 
		before do
			sign_in(user) 
			visit team_path(team.id)
		end
		it { should have_title("#{team.name}") }
		it { should have_content("join this team") }

		describe "when trying to join a team you are not on" do 
			before { click_link("join this team") }

			it { should have_content("#{user.name}") }
			it { should have_content("You are now part of the #{team.name}!")}
			
			describe "when trying to join a team you already on" do 
				before do
					click_link("join this team")
				end

				it { should have_content("You are already on this team") }
			end
		end

	end

	describe "when on the create team page" do 
		before do 
			sign_in(user)
			visit league_path(league)
			click_link "Create a team"
		end

		it { should have_title("Create Team") }


		describe "when creating a new team" do 
			before do 
				fill_in('Name', :with => 'example team')
				click_button('Create')
			end
			
			it { should have_title("#{league.name}") }
			it { should have_content("example team") }
			it { should have_content("example league") }
		end
	end

	describe "when looking at the teams in the league pages" do 
		before do 
			league.teams.create(name: "example team")
			sign_in(user)
			visit league_path(league)
		end

		describe "as the commissioner" do 
			it { should have_content("delete") }
		end

		describe "when deleting a team with credentials" do
			before { click_link("delete") }

			it { should_not have_content("example team") }
		end
	end
end