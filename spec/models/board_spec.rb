require 'spec_helper'

describe Board do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
  	@board = user.boards.build(subdomain: "test", name: "My board",
  		description: "This is my board<br>With a line break",
  		keywords: "Test,test2,test3,test4", company_name: "utmsoft",
  		address_1: "123 Test street", address_2: "PO Box 888689",
  		city: "Grand Rapids", region: "MI", country: "US", 
  		phone_number: "123-123-1234", contact_email: "example@example.com")
  end

  subject {@board}

  it { should respond_to(:subdomain) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:keywords) }
  it { should respond_to(:company_name) }
  it { should respond_to(:address_1) }
  it { should respond_to(:address_2) }
  it { should respond_to(:city) }
  it { should respond_to(:region) }
  it { should respond_to(:country) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:contact_email) }
  it { should respond_to(:ideas) }
  it { should respond_to(:user) }
  it { should respond_to(:memberships) }
  it { should respond_to(:contributors) }

  describe "when user_id is not present" do
  	before { @board.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank name" do
    before { @board.name = " " }
    it { should_not be_valid }
  end

  describe "with blank subdomain" do
    before { @board.subdomain = " " }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @board.description = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @board.name = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with subdomain that is too long" do
    before { @board.subdomain = "a" * 21 }
    it { should_not be_valid }
  end

   describe "when subdomain is already taken" do
    before do
      board_with_same_subdomain = @board.dup
      board_with_same_subdomain.subdomain = @board.subdomain.upcase
      board_with_same_subdomain.save
    end

    it { should_not be_valid }
  end

  describe "subdomain with mixed case" do
    let(:mixed_case_subdomain) { "mYsUbDomain" }

    it "should be saved as all lower-case" do
      @board.subdomain = mixed_case_subdomain
      @board.save
      expect(@board.reload.subdomain).to eq mixed_case_subdomain.downcase
    end
  end

  describe "subdomain with bad letters" do
    let(:bad_subdomain) { "m.ysub{}{@1}domain" }

    it "should be not be valid" do
      @board.subdomain = bad_subdomain
      @board.save
      
      should_not be_valid
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @board.contact_email = mixed_case_email
      @board.save
      expect(@board.reload.contact_email).to eq mixed_case_email.downcase
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @board.contact_email = valid_address
        expect(@board).to be_valid
      end
    end
  end

end
