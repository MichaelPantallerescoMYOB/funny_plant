require 'spec_helper'
require 'field'

describe Field do
  context "When testing the Field class " do
    # with the changes in the field.rb class these test will be a bit cleaner
    it 'should return 5 weeks when given 15 people and 1 starting fruit' do
      field = Field.new(15, 1) # can remove the number of people from the creation of the field
      field.calculate_weeks # could remove this part
      # weeks = field.week - can remove this part
      expect(weeks).to eq 5
      # the above could become expect(field.calculate_weeks(15)).to eq 5
    end

    it 'should return 14 weeks when given 50 000 people and 1 starting fruit' do
      field = Field.new(50000, 1)
      field.calculate_weeks
      weeks = field.week
      expect(weeks).to eq 14
    end

    it 'should return 9 weeks when given 150000 people and 250 starting fruits' do
      field = Field.new(150000, 250)
      field.calculate_weeks
      weeks = field.week
      expect(weeks).to eq 9
    end
  end
end
