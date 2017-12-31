def sign_up_user_1
  visit('/users/sign_up')
  fill_in(id: 'user_name', with: 'tom')
  fill_in(id: 'user_email', with: 'tom@tom.tom')
  fill_in(id: 'user_password', with: 'tom@tom.tom')
  fill_in(id: 'user_password_confirmation', with: 'tom@tom.tom')
  click_button('Sign up')
end

def sign_out
  visit('/')
  click_button('Sign out')
end

def sign_up_user_2
  visit('/users/sign_up')
  fill_in(id: 'user_name', with: 'tim')
  fill_in(id: 'user_email', with: 'tim@tim.tim')
  fill_in(id: 'user_password', with: 'tim@tim.tim')
  fill_in(id: 'user_password_confirmation', with: 'tim@tim.tim')
  click_button('Sign up')
end

def sign_up_user_3
  visit('/users/sign_up')
  fill_in(id: 'user_name', with: 'jim')
  fill_in(id: 'user_email', with: 'jim@jim.jim')
  fill_in(id: 'user_password', with: 'jim@jim.jim')
  fill_in(id: 'user_password_confirmation', with: 'jim@jim.jim')
  click_button('Sign up')
end

def add_new_restaurant
  visit '/restaurants/new'
  fill_in('restaurant[name]', with: 'Pizza')
  fill_in('restaurant[location]', with: 'London')
  fill_in('restaurant[min_price]', with: '1')
  fill_in('restaurant[max_price]', with: '10')
  fill_in('restaurant[description]', with: 'Pizzas')
  fill_in('restaurant[category]', with: 'Pizza')
  click_button(:value => 'Submit')
end

def sign_up_user2_visit_restaurant
  sign_out
  sign_up_user_2
  visit('/restaurants')
  click_link('Pizza')
end

def sign_up_user3_visit_restaurant
  sign_out
  sign_up_user_3
  visit('/restaurants')
  click_link('Pizza')
end
