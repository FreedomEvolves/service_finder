require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :last_name => "MyString",
      :first_name => "MyString",
      :gender => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input#client_last_name[name=?]", "client[last_name]"

      assert_select "input#client_first_name[name=?]", "client[first_name]"

      assert_select "input#client_gender[name=?]", "client[gender]"

      assert_select "input#client_address2[name=?]", "client[address2]"

      assert_select "input#client_city[name=?]", "client[city]"

      assert_select "input#client_state[name=?]", "client[state]"

      assert_select "input#client_postal_code[name=?]", "client[postal_code]"

      assert_select "input#client_country[name=?]", "client[country]"
    end
  end
end
