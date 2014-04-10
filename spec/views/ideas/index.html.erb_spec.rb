require 'spec_helper'

describe "ideas/index" do
  before(:each) do
    assign(:ideas, [
      stub_model(Idea,
        :name => "Name",
        :description => "MyText",
        :number_of_likes => 1,
        :number_of_dislikes => 2,
        :state => 3,
        :board_id => 4
      ),
      stub_model(Idea,
        :name => "Name",
        :description => "MyText",
        :number_of_likes => 1,
        :number_of_dislikes => 2,
        :state => 3,
        :board_id => 4
      )
    ])
  end

  it "renders a list of ideas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
