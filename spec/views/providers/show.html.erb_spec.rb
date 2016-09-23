require 'rails_helper'

RSpec.describe "providers/show", type: :view do
  before(:each) do
    @provider = assign(:provider, Provider.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Years Of Experience/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Specialty/)
  end
end
