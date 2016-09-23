require 'rails_helper'

RSpec.describe "providers/edit", type: :view do
  before(:each) do
    @provider = assign(:provider, Provider.create!(
      :last_name => "MyString",
      :first_name => "MyString",
      :title => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :country => "MyString",
      :years_of_experience => "MyString",
      :category => "MyString",
      :specialty => "MyString"
    ))
  end

  it "renders the edit provider form" do
    render

    assert_select "form[action=?][method=?]", provider_path(@provider), "post" do

      assert_select "input#provider_last_name[name=?]", "provider[last_name]"

      assert_select "input#provider_first_name[name=?]", "provider[first_name]"

      assert_select "input#provider_title[name=?]", "provider[title]"

      assert_select "input#provider_address1[name=?]", "provider[address1]"

      assert_select "input#provider_address2[name=?]", "provider[address2]"

      assert_select "input#provider_city[name=?]", "provider[city]"

      assert_select "input#provider_state[name=?]", "provider[state]"

      assert_select "input#provider_postal_code[name=?]", "provider[postal_code]"

      assert_select "input#provider_country[name=?]", "provider[country]"

      assert_select "input#provider_years_of_experience[name=?]", "provider[years_of_experience]"

      assert_select "input#provider_category[name=?]", "provider[category]"

      assert_select "input#provider_specialty[name=?]", "provider[specialty]"
    end
  end
end
