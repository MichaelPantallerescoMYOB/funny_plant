require_relative 'funny_plant'

class Field
  # attr_reader :target_harvest, :week I would remove this section as you are only seeking the week from the calucation

  def initialize(people_to_feed, seeds)
    @plants = plant(seeds)
    # @target_harvest = people_to_feed Can be passed into the calculate_weeks method
    @week = 1
  end

  def calculate_weeks(target_harvet) # pass the target harvet straight into the method 
    fruits_produced = 0
    fruits_produced = harvest
    until fruits_produced > target_harvest
      increment_week
      fruits_produced = harvest
      plant(fruits_produced)
    end
    @week # This will allow you to return the week from within the method, week isn't really apart of the feild class.
  end

  private

  def plant(seeds)
    if @plants
      i = 0
      while i < seeds
        plant = FunnyPlant.new
        @plants << plant
        i+=1
      end
    else
      Array.new(seeds) {FunnyPlant.new}
    end
  end

  def increment_week
      @plants.each do |plant|
        plant.new_week
        # p "plant week is #{plant.week}"
      end
      @week += 1
  end

  def harvest
    harvest = 0
    @plants.each do |plant|
      harvest += plant.fruits(plant.week)
      # puts "harvest is #{harvest}"
    end
    harvest
  end
end

# this would become 
# field = Field.new(1)
# puts field.calulate_weeks(15)
# -----------------------------
# field = Field.new(15, 1)
# field.calculate_weeks
# puts field.week
