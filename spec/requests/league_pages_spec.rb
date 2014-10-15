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

		describe "when signed in" do 
			before do 
				sign_in(user)
				visit new_user_league_path(user)
			end
			it { should have_title("Create League") }
			it { should have_button("Create your league!") }
		end

		describe "after creating league" do 
			before do 
				fill_in
			end
		end
	end

end