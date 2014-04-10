require 'spec_helper'

describe "ideas/new" do
  before(:each) do
    assign(:idea, stub_model(Idea,
      :name => "MyString",
      :description => "MyText",
      :number_of_likes => 1,
      :number_of_dislikes => 1,
      :state => 1,
      :board_id => 1
    ).as_new_record)
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ideas_path, "post" do
      assert_select "input#idea_name[name=?]", "idea[name]"
      assert_select "textarea#idea_description[name=?]", "idea[description]"
      assert_select "input#idea_number_of_likes[name=?]", "idea[number_of_likes]"
      assert_select "input#idea_number_of_dislikes[name=?]", "idea[number_of_dislikes]"
      assert_select "input#idea_state[name=?]", "idea[state]"
      assert_select "input#idea_board_id[name=?]", "idea[board_id]"
    end
  end
end
