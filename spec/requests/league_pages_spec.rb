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

end