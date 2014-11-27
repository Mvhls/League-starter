require 'spec_helper'

describe "team pages" do 

	subject { page }

	create_user_league

	describe "when visiting the index" do 
		before do 
			team = league.teams.create(name: "example team" )
			visit league_teams_path(league)
		end

		it { should have_title("Teams") }
		it { should have_content("example team") }
		it { should have_content("example league") }

	end

	describe "when creating a new team" do 
		before do 
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

	describe "when trying to delete a team" do 
		before do 
			visit league_path(league)
			click_link "Create a team"
			fill_in('Name', :with => 'example team')
			click_button('Create')
		end

		describe "when deleting a team with credentials" do
			before { click_link("delete") }

			it { should_not have_content("example team") }
		end
	end
end