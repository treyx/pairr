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
    expect(page).to have_content("wycats")
    expect(page).to have_content("Accept")
    expect(page).to have_content("Reject")
  end

  scenario "can view an available pair" do
    User.create(username: "wycats")
    click_link_or_button("Find Pairs")
    expect(page).to have_content("wycats")
    click_link_or_button("Accept")
    expect(page).to_not have_content(other_user.username)
  end

  scenario "can see a previously matched user first" do
    login_second
    visit matches_path
    expect(page).to have_content("first_user")
    click_link_or_button("Accept")
    login_first
    visit matches_path
    expect(page).to have_content("second_user")
  end

  scenario "can complete a match" do
    login_second
    visit matches_path
    expect(page).to have_content("first_user")
    click_link_or_button("Accept")
    login_first
    visit matches_path
    click_link_or_button("Accept")
    expect(page).to have_content("Congrats!")
    visit root_path
    expect(page).to have_content("Mutual Matches")
  end
end
