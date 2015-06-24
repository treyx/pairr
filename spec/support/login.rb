module Login
  OmniAuth.config.test_mode = true

  def mock_omniauth_user
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider" => "github",
      "uid"      => "123456",
      "info" => {
        "name" =>  "mock_user",
      },
    })
  end

  def login
    visit new_user_path
    mock_omniauth_user
    click_link_or_button "Login With GitHub"
  end
end
