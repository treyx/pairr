require "rails_helper"

RSpec.feature "user signup" do
  scenario "should be prompted to login when visiting root" do
    visit root_path
    expect(page).to have_content("Please Register an Account")
  end
end
