module Login
  OmniAuth.config.test_mode = true

  def mock_first_user
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider" => "github",
      "uid"      => "123456",
      "info" => {
        "name" =>  "first_user",
      },
    })
  end

  def mock_second_user
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider" => "github",
      "uid"      => "789789",
      "info" => {
        "name" =>  "second_user",
      },
    })
  end

  def login_first
    visit new_user_path
    mock_first_user
    click_link_or_button "Login With GitHub"
  end

  def login_second
    visit new_user_path
    mock_second_user
    click_link_or_button "Login With GitHub"
  end
end
