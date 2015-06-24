require "rails_helper"
OmniAuth.config.test_mode = true

RSpec.feature "user signup" do

  scenario "should be prompted to signup when visiting root" do
    visit root_path
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Please Register an Account")
  end

  scenario "should be able to signup with GitHub Omniauth" do
    visit new_user_path
    expect do
      mock_omniauth_user
      click_link_or_button "Login With GitHub"
    end.to change{ User.count }.from(0).to(1)
  end

  scenario "should be prompted to add about text if new user" do
    visit new_user_path
    mock_omniauth_user
    click_link_or_button "Login With GitHub"
    expect(page).to have_content("Please Tell Us Some More Information")
  end
end

private

def mock_omniauth_user
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "provider" => "github",
    "uid"      => "123456",
    "info" => {
      "name" =>  "mock_user",
    },
  })
end
