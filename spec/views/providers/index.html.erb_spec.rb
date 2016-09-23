require 'rails_helper'

RSpec.describe "providers/index", type: :view do
  before(:each) do
    assign(:providers, [
      Provider.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :title => "Title",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country => "Country",
        :years_of_experience => "Years Of Experience",
        :category => "Category",
        :specialty => "Specialty"
      ),
      Provider.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :title => "Title",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country => "Country",
        :years_of_experience => "Years Of Experience",
        :category => "Category",
        :specialty => "Specialty"
      )
    ])
  end

  it "renders a list of providers" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Years Of Experience".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Specialty".to_s, :count => 2
  end
end
