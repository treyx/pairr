require "rails_helper"
include Login

RSpec.feature "user signup" do

  scenario "should be prompted to signup when visiting root" do
    visit root_path
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Please Register an Account")
  end

  scenario "should be able to signup with GitHub Omniauth" do
    expect do
      login_first
    end.to change{ User.count }.from(0).to(1)
  end

  scenario "should be prompted to add about text if new user" do
    login_first
    expect(page).to have_content("Please Tell Us Some More Information")
  end
end
