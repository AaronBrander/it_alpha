require 'spec_helper'

describe "boards/new" do
  before(:each) do
    assign(:board, stub_model(Board,
      :subdomain => "MyString",
      :name => "MyString",
      :description => "MyText",
      :keywords => "MyText",
      :company_name => "MyString",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :region => "MyString",
      :postal_code => "MyString",
      :country => "MyString",
      :phone_number => "MyString",
      :contact_email => "MyString",
      :state => 1,
      :is_private => false
    ).as_new_record)
  end

  it "renders new board form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boards_path, "post" do
      assert_select "input#board_subdomain[name=?]", "board[subdomain]"
      assert_select "input#board_name[name=?]", "board[name]"
      assert_select "textarea#board_description[name=?]", "board[description]"
      assert_select "textarea#board_keywords[name=?]", "board[keywords]"
      assert_select "input#board_company_name[name=?]", "board[company_name]"
      assert_select "input#board_address_1[name=?]", "board[address_1]"
      assert_select "input#board_address_2[name=?]", "board[address_2]"
      assert_select "input#board_city[name=?]", "board[city]"
      assert_select "input#board_region[name=?]", "board[region]"
      assert_select "input#board_postal_code[name=?]", "board[postal_code]"
      assert_select "input#board_country[name=?]", "board[country]"
      assert_select "input#board_phone_number[name=?]", "board[phone_number]"
      assert_select "input#board_contact_email[name=?]", "board[contact_email]"
      assert_select "input#board_state[name=?]", "board[state]"
      assert_select "input#board_is_private[name=?]", "board[is_private]"
    end
  end
end
