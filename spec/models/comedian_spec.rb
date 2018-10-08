RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)

        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')

        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an city that was born' do
        comic = Comedian.create(name: 'Mitch Hedberg')

        expect(comic).to_not be_valid
      end
    end
  end

  describe 'Average' do
    it 'should get the average of comedians ages' do
      comedian_1 = Comedian.create(name: 'Louis C.K.', age: 51, city: 'Washinton DC' )
      comedian_2 = Comedian.create(name: 'Bill Cosby', age: 81, city: 'Philadelphia' )
      comedian_3 = Comedian.create(name: 'John Mulaney', age: 36, city: 'Chicago' )
      comedian_4 = Comedian.create(name: 'Aziz Anzari', age: 35, city: 'Columbia' )

      to_expect = Comedian.average_age

      expect(to_expect).to eq(50.75)
    end
  end

  describe 'get comedians by city' do
    it 'should a list of comedians by birth city' do
      comedian_1 = Comedian.create(name: 'Louis C.K.', age: 51, city: 'Washinton DC' )
      comedian_2 = Comedian.create(name: 'Bill Cosby', age: 81, city: 'Philadelphia' )
      comedian_3 = Comedian.create(name: 'John Mulaney', age: 36, city: 'Chicago' )
      comedian_4 = Comedian.create(name: 'Aziz Anzari', age: 35, city: 'Columbia' )
      comedian_5 = Comedian.create(name: 'Many Manequinn', age: 370, city: 'Chicago')

      to_expect = Comedian.unique_cities
      actual = [comedian_1.city, comedian_2.city, comedian_3.city, comedian_4.city]

      expect(to_expect).to eq(actual)
    end
  end
end
