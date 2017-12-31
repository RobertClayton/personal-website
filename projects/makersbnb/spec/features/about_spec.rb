feature 'user can go back to welcome page', js: true do
  scenario 'when on the about page and want to go to welcome page' do
    add_all_rentals
    visit '/welcome'
    click_button('About')
    visit '/about'
    click_button('Back To Home')
    expect(page).to have_current_path('/welcome')
  end

end
