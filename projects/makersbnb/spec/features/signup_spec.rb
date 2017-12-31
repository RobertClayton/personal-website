feature 'sign up' do
  scenario 'signing up takes you to the welcome page' do
    visit '/signup'
    lewis_signup
    expect(page).to have_current_path('/welcome')
    expect(page).to have_content('Welcome Lewis')
  end
  scenario 'sign up page checks whether your passwords are the same' do
    expect{failed_signup}.not_to change(User, :count)
  end
  scenario 'raises error if passwords do not match' do
    failed_signup
    expect(page).to have_content('Passwords do not match')
  end
  scenario "user can't sign up with the same email twice" do
    lewis_signup
    click_button('Logout')
    lewis_signup_2
    expect(page).to have_content('Email already in use. SOZ LOLZ!!!!!')
  end
end
