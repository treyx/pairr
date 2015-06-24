require "rails_helper"
include Login

RSpec.feature "user matches" do
  let(:other_user) { User.create(username: "wycats") }
  before(:each) do
    login_first
    visit root_path
  end

  scenario "should see a link to find matches" do
    expect(page).to have_content("Find Pairs")
  end

  scenario "can view an available pair" do
    User.create(username: "wycats")
    click_link_or_button("Find Pairs")
    expect(page).to have_content(other_user.username)
    expect(page).to have_content("Accept")
    expect(page).to have_content("Reject")
  end

  scenario "can view an available pair" do
    User.create(username: "wycats")
    click_link_or_button("Find Pairs")
    expect(page).to have_content(other_user.username)
    click_link_or_button("Accept")
    click_link_or_button("Accept")
    expect(page).to_not have_content(other_user.username)
    expect(page).to have_content("There aren't any more users... Tell your friends!")
  end

  scenario "can see a previously matched user first" do
    User.create(username: "wycats")
    click_link_or_button("Find Pairs")
    click_link_or_button("Accept")
    login_second
    visit root_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("first_user")
  end
end
