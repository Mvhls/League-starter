require 'spec_helper'

describe "league pages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }

	describe "when visiting the index" do 
		before do 
			league = user.leagues.create(name: "example league")
			visit leagues_path
		end

		it { should have_title("Leagues") }
		it { should have_content("Leagues") }
		it { should have_content("example league") }
	end

	
	describe "when visiting a league page" do 


		before do 
			league = user.leagues.create(name: "example league")
			visit league_path(league.id)
		end

		it { should have_title("example league") }
		it { should have_content("example league") }
	end

	describe "when creating a new league" do

		describe "when signed in as correct user" do 
			before do 
				sign_in(user)
				visit new_user_league_path(user)
			end
			it { should have_title("Create League") }
			it { should have_button("Create your league!") }

			describe "after creating league" do 
				before do 
					fill_in "Name", with: "example league 2"
					click_button "Create your league!"
				end

				it { should have_title("example league 2") }
			end
		end

		describe "when signed in as incorrect user" do 
			let(:incorrect_user) { FactoryGirl.create(:user) }
			before { sign_in(incorrect_user) }

			describe "when trying visiting another user's page" do 
				before { visit user_path(user) }
				it { should_not have_content("Create a league") }
			end

			describe "when trying to create a league under the wrong user" do 
				before { visit new_user_league_path(user) }
				
				it { should_not have_title("Create League") }
				it { should have_title("Home") }
			end
		end
	end
end