require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :gender => "Gender",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country => "Country"
      ),
      Client.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :gender => "Gender",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country => "Country"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
