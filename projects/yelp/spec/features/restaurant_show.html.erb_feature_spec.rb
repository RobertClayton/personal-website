require 'rails_helper'

feature 'Openning the page' do
  before(:each) do
    sign_up_user_1
    add_new_restaurant
  end

  scenario 'it shows the restaurant information' do
    expect(page).to have_content('Restaurant Name: Pizza')
  end

  scenario 'It have a reviews section' do
    sign_up_user2_visit_restaurant
    expect(page).to have_content('Leave a review')
    expect(page).to have_content('Review Rating')
    expect(page).to have_content('Comments')
  end

  scenario 'It displays all of the reviews for the restaurant' do
    sign_up_user2_visit_restaurant
    choose(id: 'review_rating_5')
    fill_in('review[comments]', with: 'I loved it!')
    click_button('Submit')
    expect(page).to have_content('Comment: I loved it!')
  end

  scenario 'It displays the average ratings of restaurant as a float' do
    sign_up_user2_visit_restaurant
    choose(id: 'review_rating_5')
    fill_in('review[comments]', with: 'I loved it!')
    click_button('Submit')

    sign_up_user3_visit_restaurant
    choose(id: 'review_rating_2')
    fill_in('review[comments]', with: 'I loved it!')
    click_button('Submit')

    expect(page).to have_content('Average rating: 3.5')
  end

end
