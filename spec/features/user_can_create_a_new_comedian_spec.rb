RSpec.describe "a visitor can create a new comedian" do
  it "should fill a form, send it and create a comedian" do
    comedian_1 = Comedian.create(name: 'Louis C.K.', age: 51, city: 'Washinton DC' )
    comedian_1.specials.create(name: 'live in Houston', run_time_length: 65, year: 2001, image_url: 'https://media.vanityfair.com/photos/5b869da54242d94606988403/master/w_1920,c_limit/louis-ck-comedy-cellar-noam-dworman-interview.jpg')
    comedian_1.specials.create(name: 'Chewed up', run_time_length: 80, year: 2008, image_url: 'https://consequenceofsound.files.wordpress.com/2017/11/screen-shot-2017-11-10-at-1-42-22-pm.png?w=1614')
    comedian_1.specials.create(name: 'Shameless', run_time_length: 70, year: 2007, image_url: 'https://images.tmz.com/2018/08/28/0828-louis-ck-getty-3.jpg')
    comedian_2 = Comedian.create(name: 'Bill Cosby', age: 81, city: 'Philadelphia' )
    comedian_2.specials.create(name: 'Cosby', run_time_length: 100, year: 1987, image_url: 'https://media.vanityfair.com/photos/5baa6c046e085a486b37c027/master/w_1920,c_limit/bill-cosby-sentencing.jpg')

    visit '/comedians/new'

    comedian_name = 'Many Manequinn'

    within('.new_comedian') do
      fill_in 'comedian[name]', with: comedian_name
      fill_in 'comedian[age]', with: 2
      fill_in 'comedian[city]', with: 'Gadsden'
      click_button 'Create Comedian'
    end


    expect(current_path).to eq("/comedians")

    expect(page).to have_content(comedian_name)
  end
end
