require 'spec_helper'

describe "User Pages" do
	subject { page }

	describe "profile page" do
	    let(:user) { FactoryGirl.create(:user) }
	    let!(:board1) { FactoryGirl.create(:board, user: user) }
	    let!(:board2) { FactoryGirl.create(:board, user: user) }
	    
	    let(:user2) { FactoryGirl.create(:user) }
		let!(:board3) { FactoryGirl.create(:board, user: user2) }
		let!(:board4) { FactoryGirl.create(:board, user: user2) }
	    
	    ADD_BOARD_LINK = "Add a board"

	    before { visit user_path(user) }

	    it { should have_content(user.first_name) }
	    it { should have_title([user.first_name, user.last_name].join(' ')) }
	    it { should have_selector('h2', text: 'Boards') }

	    describe "has a list of owned boards" do 
	    	it { should have_content(board1.name) }
      		it { should have_content(board2.name) }
      		it { should have_content(user.boards.count) }

      		describe "not signed in - can't add a board" do
	    		it { should_not have_link(ADD_BOARD_LINK, href: new_board_path) }
		    end

		    describe "signed in user can add a new board on his profile" do
		    	before { sign_in user }
		    	before { visit user_path(user) }

		    	it { should have_link(ADD_BOARD_LINK, href: new_board_path) }
			end

			describe "signed in user can't add a new board on a different profile" do
				
		    	before { sign_in user }
		    	before { visit user_path(user2) }

		    	it { should_not have_link(ADD_BOARD_LINK, href: new_board_path) }
			end
	    end

	    describe "has a list of joined boards" do
	    	before do
	    		user.join!(board1)
	    		user.join!(board2)
	    		user.join!(board3)
	    		visit user_path(user)
	    		
	    	end

	    	it { should have_content(user.joined_boards.count) }
	    	it { should have_content(board3.name) }
      		it { should_not have_content(board4.name) }

      		describe "not signed in - can't leave board" do
	    		it { should_not have_link("leave") }
		    end

		    describe "signed in user can leave board on his profile" do
		    	before { sign_in user }
		    	before { visit user_path(user) }

		    	describe "should be able to delete the membership" do
		    		it { should have_link("leave", href: membership_path(board3)) 	}

		    		
		    		it  "should delete" do
      					
      					expect do
			            	click_link('leave', match: :first)
			            end.to change(Membership, :count).by(-1)
      				end
      			end
			end

			describe "signed in user can't remove membership on a different profile" do
				
		    	before { sign_in user }
		    	before do 
		    		user2.join!(board1)
		    		visit user_path(user2) 
		    	end

		    	it { should_not have_link("leave") }
			end
    		    	
	    end


	end

  	describe "signup page" do
	    before { visit signup_path }

	    it { should have_content('Sign up') }
	    it { should have_title(full_title('Sign up')) }
	end

	describe "signup" do

	    before { visit signup_path }

	    let(:submit) { "Create my account" }

	    describe "with invalid information" do
	      it "should not create a user" do
	        expect { click_button submit }.not_to change(User, :count)
	      end

	      describe "after submission" do
	        before { click_button submit }

	        it { should have_title('Sign up') }
	        it { should have_content('error') }
	      end
	    end

	    describe "with valid information" do
	      before do
	        fill_in "First name",         with: "Example"
	        fill_in "Last name",         with: "User"
	        fill_in "Email",        with: "user@example.com"
	        fill_in "Password",     with: "foobar"
	        fill_in "Confirmation", with: "foobar"
	      end

	      it "should create a user" do
	        expect { click_button submit }.to change(User, :count).by(1)
	      end

	      describe "after saving the user" do
	        before { click_button submit }
	        let(:user) { User.find_by(email: 'user@example.com') }

	        it { should have_title([user.first_name, user.last_name].join(' ')) }
	        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
	      end

	      describe "after saving the user" do
	        before { click_button submit }
	        let(:user) { User.find_by(email: 'user@example.com') }

	        it { should have_link('Sign out') }
	        it { should have_title(user.first_name) }
	        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
	      end
	    end
	 end


end
