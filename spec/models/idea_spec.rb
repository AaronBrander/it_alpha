require 'spec_helper'

describe Idea do
  
  before do
  	@user = User.new(first_name: "Example", last_name: "User",
    				email: "user@example.com", password: "foobar", 
    				password_confirmation: "foobar")

  	@idea = @user.ideas.build(name: "Idea 1", 
  		description: "This is my idea<br>With a line break",
  		number_of_likes: 5, number_of_dislikes: 10, board_id: 1)

  end

  subject { @idea }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:number_of_likes) }
  it { should respond_to(:number_of_dislikes) }
  it { should respond_to(:state) }
  it { should respond_to(:board_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:board) }
  it { should respond_to(:relationships) }
  it { should respond_to(:joined_users) }


  describe "when user_id is not present" do
  	before { @idea.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank name" do
    before { @idea.name = " " }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @idea.description = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @idea.name = "a" * 141 }
    it { should_not be_valid }
  end



end
