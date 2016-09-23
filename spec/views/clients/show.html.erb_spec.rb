require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :last_name => "Last Name",
      :first_name => "First Name",
      :gender => "Gender",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :postal_code => "Postal Code",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
  end
end
