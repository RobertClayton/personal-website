require 'rails_helper'

RSpec.describe "restaurants/new.html.erb" do

  describe 'when opening the page' do

    before(:each) do
      visit('/users/sign_up')
      fill_in(id: 'user_name', with: 'tom')
      fill_in(id: 'user_email', with: 'tom@tom.tom')
      fill_in(id: 'user_password', with: 'tom@tom.tom')
      fill_in(id: 'user_password_confirmation', with: 'tom@tom.tom')
      click_button('Sign up')

      visit('/restaurants/new')
    end

    it "has content New Restaurant" do
      expect(page).to have_content('New Restaurant')
    end

    it 'has a name field' do
      expect(page).to  have_field(:type => 'text', :name => 'restaurant[name]')
    end

    it 'has a description field' do
      expect(page).to  have_field(:type => 'textarea', :name => 'restaurant[description]')
    end

    it 'has a submit button' do
      expect(page).to have_button(value: 'Submit')
    end

    it 'has a location field' do
      expect(page).to have_field(:type => 'text', :name => 'restaurant[location]')
    end

    it 'has a min price field for price range' do
      expect(page).to have_field(:type => 'text', :name => 'restaurant[min_price]')
    end

    it 'has a max price field for price range' do
      expect(page).to have_field(:type => 'text', :name => 'restaurant[max_price]')
    end

    it 'has a category field' do
      expect(page).to have_field(:type => 'text', :name => 'restaurant[category]')
    end
  end

end
