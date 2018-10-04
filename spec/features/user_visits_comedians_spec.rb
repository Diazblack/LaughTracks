RSpec.describe 'User visits comedians page' do
 it 'should show the comedian web page' do

    comedian_1 = Comedian.create!(name: 'Louis C.K.', age: 51, city: 'Washinton DC' )
    special_1 = comedian_1.specials.create(name: 'live in Houston', run_time_length: 65, year: 2001, image_url: 'https://media.vanityfair.com/photos/5b869da54242d94606988403/master/w_1920,c_limit/louis-ck-comedy-cellar-noam-dworman-interview.jpg')
    special_2 = comedian_1.specials.create(name: 'Chewed up', run_time_length: 80, year: 2008, image_url: 'https://consequenceofsound.files.wordpress.com/2017/11/screen-shot-2017-11-10-at-1-42-22-pm.png?w=1614')
    special_3 = comedian_1.specials.create(name: 'Shameless', run_time_length: 70, year: 2007, image_url: 'https://images.tmz.com/2018/08/28/0828-louis-ck-getty-3.jpg')

    visit '/comedians'

    save_and_open_page
    
    expect(page).to have_content(comedian_1.name)
    expect(page).to have_content(comedian_1.age)
    expect(page).to have_content(comedian_1.city)
    expect(page).to have_content(special_1.name)
    expect(page).to have_content(special_1.run_time_length)
    expect(page).to have_content(special_2.name)
    expect(page).to have_content(special_2.run_time_length)
    expect(page).to have_content(special_3.name)
    expect(page).to have_content(special_3.run_time_length)
  end
end
