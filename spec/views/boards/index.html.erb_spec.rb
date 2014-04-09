require 'spec_helper'

describe "boards/index" do
  before(:each) do
    assign(:boards, [
      stub_model(Board,
        :subdomain => "Subdomain",
        :name => "Name",
        :description => "MyText",
        :keywords => "MyText",
        :company_name => "Company Name",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :region => "Region",
        :postal_code => "Postal Code",
        :country => "Country",
        :phone_number => "Phone Number",
        :contact_email => "Contact Email",
        :state => 1,
        :is_private => false
      ),
      stub_model(Board,
        :subdomain => "Subdomain",
        :name => "Name",
        :description => "MyText",
        :keywords => "MyText",
        :company_name => "Company Name",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :region => "Region",
        :postal_code => "Postal Code",
        :country => "Country",
        :phone_number => "Phone Number",
        :contact_email => "Contact Email",
        :state => 1,
        :is_private => false
      )
    ])
  end

  it "renders a list of boards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
