feature 'create a rental property' do
  scenario 'user can add a rental' do
    expect{ add_rental }.to change(Rental, :count).by(1)
  end
end
