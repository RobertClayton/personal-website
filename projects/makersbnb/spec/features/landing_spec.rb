feature 'landing page' do
  scenario 'user receives welcome message' do
    visit '/'
    expect(page).to have_content('Welcome to MakersBnB')
  end
  scenario 'user can sign up' do
    visit '/'
    click_button('Sign Up')
    expect(page).to have_current_path('/signup')
    expect(page).to have_content('Enter your details to get started!')
  end
  scenario 'user can login in' do
    lewis_signup
    lewis_sucess_login
    expect(page).to have_current_path('/welcome')
    expect(page).to have_content('Welcome Lewis101')
  end
  scenario "user can't log in if email and password don't match database" do
    lewis_signup
    lewis_failed_login
    # expect(page).to have_current_path('/')
    expect(page).to have_content('Email and Password does not match')
  end
end
