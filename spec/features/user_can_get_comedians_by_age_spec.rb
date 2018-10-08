RSpec.describe 'User can see comedians by an specific age in page' do
  it 'should show comedians by age in the page and the Statistics change with the search' do
    comedian_1 = Comedian.create(name: 'Louis C.K.', age: 51, city: 'Washinton DC' )
    comedian_1.specials.create(name: 'live in Houston', run_time_length: 65, year: 2001, image_url: 'https://media.vanityfair.com/photos/5b869da54242d94606988403/master/w_1920,c_limit/louis-ck-comedy-cellar-noam-dworman-interview.jpg')
    comedian_1.specials.create(name: 'Chewed up', run_time_length: 80, year: 2008, image_url: 'https://consequenceofsound.files.wordpress.com/2017/11/screen-shot-2017-11-10-at-1-42-22-pm.png?w=1614')
    comedian_1.specials.create(name: 'Shameless', run_time_length: 70, year: 2007, image_url: 'https://images.tmz.com/2018/08/28/0828-louis-ck-getty-3.jpg')
    comedian_2 = Comedian.create(name: 'Bill Cosby', age: 81, city: 'Philadelphia' )
    comedian_2.specials.create(name: 'Cosby', run_time_length: 100, year: 1987, image_url: 'https://media.vanityfair.com/photos/5baa6c046e085a486b37c027/master/w_1920,c_limit/bill-cosby-sentencing.jpg')

    visit '/comedians?age=81'

    expect(page).to have_content(comedian_2.age)
    expect(page).to have_content(comedian_2.name)
    expect(page).to have_content(comedian_2.city)
    expect(page).to have_content(comedian_2.city)
    expect(page).to have_content(comedian_2.city)
    expect(page).to_not have_content(comedian_1.age)
    expect(page).to_not have_content(comedian_1.name)
    expect(page).to_not have_content(comedian_1.city)
    binding.pry
    expect(page).to have_content(comedian_2.specials.name)
    expect(page).to_not have_content(comedian_1.specials.name)

    within '.average_age' do
      expect(page).to have_content("#{comedian_2.city} Years Old")
    end

    within '.average_time_length' do
      expect(page).to have_content('100')
    end

    within '.sum_of_all_tv_specials' do
      expect(page).to have_content('1')
    end

    within '.comedians_cities' do
      expect(page).to have_content('Philadelphia')
    end
  end
end
