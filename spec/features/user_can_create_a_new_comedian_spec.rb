RSpec.describe "a visitor can create a new comedian" do
  xit "should fill a form and send it" do
    visit '/comedians/new'

    comedian_name = 'Many Manequinn'

    within('.new_comedian') do
      fill_in 'comedian[name]', with: comedian_name
      fill_in 'comedian[age]', with: 2
      fill_in 'comedian[city]', with: 'Gadsden'
      click_button 'Create Comedian'
    end

    expect(page).to have_content(comedian_name)
  end
end
