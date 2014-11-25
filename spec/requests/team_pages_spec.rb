require 'spec_helper'

describe "team pages" do 

	subject { page }

	create_user_league

	describe "when visiting the index" do 
		before do 
			team = league.teams.create(name: "example league" )
			visit teams_path
		end

		it { should have_title("teams") }
		it { should have_content("example team") }
		it { should have_content("example league") }

	end
	
end