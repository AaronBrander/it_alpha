require 'spec_helper'

describe "Boards" do
  subject { page }
  describe "Create" do
  	describe "Visit without Signin" do
  		before { visit new_board_path }
  		it { should_not have_title('Create a New Board')}
  	end

  	describe "Visit after signin" do
  		let(:user) { FactoryGirl.create(:user) }
  		let(:submit) { "Get Started" }

  		before do
  			sign_in user
  			visit new_board_path
  		end

  		it { should have_title('Create a New Board')}

  		describe "with invalid information" do
  		  it "should not create a board" do
	        expect { click_button submit }.not_to change(Board, :count)
	      end

	      describe "after submission" do
	        before { click_button submit }

	        it { should have_title('Create a New Board') }
	        it { should have_content('error') }
	      end
  		end

  		describe "with valid information" do
	      before do
	        fill_in "Subdomain",         with: "my-test-board"
	        fill_in "Name",         with: "Test Board"
	        fill_in "Description",        with: "Some ideas here!"
	        
	      end

	      it "should create a board" do
	        expect { click_button submit }.to change(Board, :count).by(1)
	      end

	      describe "after saving the board" do
	        before { click_button submit }
	        let(:board) { Board.find_by(subdomain: 'my-test-board') }

	        it { should have_title(board.subdomain) }
	        it { should have_selector('div.alert.alert-success', text: "Here's your new board!") }

	        describe "the board should be related to the user that created it" do
	        	before { visit user_path(user) }
	        	it { should have_content(board.name) }
	        end
	      end

	      
	    end
  	end

  end
end
