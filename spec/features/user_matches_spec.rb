require "rails_helper"
include Login

RSpec.feature "user matches" do
  let(:other_user) { User.create(username: "wycats") }
  before(:each) do
    login
    visit root_path
  end

  scenario "should see a link to find matches" do
    expect(page).to have_content("Find Pairs")
  end

  scenario "can view an available pair" do
    click_link_or_button("Find Pairs")
    expect(page).to have_content(other_user.username)
    expect(page).to have_content("Approve")
    expect(page).to have_content("Reject")
  end
end
