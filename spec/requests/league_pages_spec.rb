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
		it { should have_content("Leagues")}
		it { should have_content("example league")}
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

		describe "with invalid credentials" do 
			before { visit new_users_league_path }

			it { should have_content("Sign up now!")}
		end
	end

end