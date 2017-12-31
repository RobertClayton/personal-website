describe User do
  let!(:user) do
    User.create(name: 'Lewis', email: 'lewis@gmail.com', password: 'airbnbwithfrogs12', password_confirmation: 'airbnbwithfrogs12')
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it "doesn't authenticate when the password is incorrect" do
    expect(User.authenticate(user.email, 'thewrongpassword')).to be_nil
  end

  it "returns true if email already in use" do
    expect(User.email_checker('lewis@gmail.com')).to eq(true)
  end
end
