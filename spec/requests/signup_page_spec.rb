require 'spec_helper'

describe "Signup" do
  let(:user) { create(:user) }
  before { visit root_path }
  it "should sign up a user" do
    page.should have_link("Sign Up!")
    click_link("Sign Up!") 
    fill_in "Email", :with => "julian@ryan.com"
    fill_in "Username", :with => "juliansohot"
    fill_in "Password", :with => "scrubmysexyfeet"
    click_button("Create User")
    page.should have_content("Success")
  end


    
   # have a link to signup" do
    
    
    # page.have_link   
  # end
  

end
