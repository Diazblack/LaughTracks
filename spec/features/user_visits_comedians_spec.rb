RSpec.describe 'User visits comedians page' do
 it 'should show the comedian web page' do
   visit '/comedians'

   within('h1') do
     expect(page).to has_content('Comedians')
   end
  end
end
