RSpec.describe Special do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create
        expect(special).to_not be_valid
      end
    end
  end

  describe 'Sum' do
    it 'should get sum of all the specials run time length ' do
      comedian_1 = Comedian.create(name: 'Louis C.K.', age: 51, city: 'Washinton DC' )
      comedian_1.specials.create(name: 'live in Houston', run_time_length: 65, year: 2001, image_url: 'https://media.vanityfair.com/photos/5b869da54242d94606988403/master/w_1920,c_limit/louis-ck-comedy-cellar-noam-dworman-interview.jpg')
      comedian_1.specials.create(name: 'Chewed up', run_time_length: 80, year: 2008, image_url: 'https://consequenceofsound.files.wordpress.com/2017/11/screen-shot-2017-11-10-at-1-42-22-pm.png?w=1614')
      comedian_1.specials.create(name: 'Shameless', run_time_length: 70, year: 2007, image_url: 'https://images.tmz.com/2018/08/28/0828-louis-ck-getty-3.jpg')
      comedian_2 = Comedian.create(name: 'Bill Cosby', age: 81, city: 'Philadelphia' )
      comedian_2.specials.create(name: 'Bill Cosby', run_time_length: 100, year: 1987, image_url: 'https://media.vanityfair.com/photos/5baa6c046e085a486b37c027/master/w_1920,c_limit/bill-cosby-sentencing.jpg')

      to_expect = Special.time_length_sum

      expect(to_expect).to eq(315)
    end

    it 'should get the sum of all comedians specials' do
      comedian_1 = Comedian.create(name: 'Louis C.K.', age: 51, city: 'Washinton DC' )
      comedian_1.specials.create(name: 'live in Houston', run_time_length: 65, year: 2001, image_url: 'https://media.vanityfair.com/photos/5b869da54242d94606988403/master/w_1920,c_limit/louis-ck-comedy-cellar-noam-dworman-interview.jpg')
      comedian_1.specials.create(name: 'Chewed up', run_time_length: 80, year: 2008, image_url: 'https://consequenceofsound.files.wordpress.com/2017/11/screen-shot-2017-11-10-at-1-42-22-pm.png?w=1614')
      comedian_1.specials.create(name: 'Shameless', run_time_length: 70, year: 2007, image_url: 'https://images.tmz.com/2018/08/28/0828-louis-ck-getty-3.jpg')
      comedian_2 = Comedian.create(name: 'Bill Cosby', age: 81, city: 'Philadelphia' )
      comedian_2.specials.create(name: 'Bill Cosby', run_time_length: 100, year: 1987, image_url: 'https://media.vanityfair.com/photos/5baa6c046e085a486b37c027/master/w_1920,c_limit/bill-cosby-sentencing.jpg')

      to_expect = Special.all_count

      expect(to_expect).to eq(4)
    end
  end
end
