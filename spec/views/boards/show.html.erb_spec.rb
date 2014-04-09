require 'spec_helper'

describe "boards/show" do
  before(:each) do
    @board = assign(:board, stub_model(Board,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subdomain/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Company Name/)
    rendered.should match(/Address 1/)
    rendered.should match(/Address 2/)
    rendered.should match(/City/)
    rendered.should match(/Region/)
    rendered.should match(/Postal Code/)
    rendered.should match(/Country/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Contact Email/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
