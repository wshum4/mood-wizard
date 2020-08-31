require 'date'
class Mood < ApplicationRecord
  belongs_to :user

  validates :sad_happy, :angry_calm, :lowenergy_highenergy, :anxious_social, presence: true

  def time_since
    # Returns the number of seconds since the mood was created
    Time.now - manual_created_at
  end

  def self.average_happiness(user)
    total_happiness = 0
    tatal_sadness = 0
    # fetch all moods for the current user and  store them in  a variabale
    @all_moods = current_user.moods.select {|mood| (mood.created_at - Date.today).to_i <= 7}

    # loop through the moods
    @all_moods.each  do |mood|
      # calculate a single happiness number from the current mood and store it in a variable (called it happiness)
      @total_happiness += mood.sad_happy
      # calculate a single sadness number from the current mood and store it in a variable (called it sadness)
      @total_sadness += 10 - mood.sad_happy
   end
      # increment the total happiness by current happiness
      @average_happiness = @total_happiness / @all_moods.count
       # increment the total sadness by current sadness
       @average_sadness = @total_sadness / @all_moods.count
    # create a new variable storring the number of moods in the moods array and call it count
    # define the average happiness as total happiness/ by count
    # define the average sadness as total sadness/ by count
    # return the hash of average happiness and the average sadness
     return {average_happiness: @average_happiness , average_sadness: @average_sadness}
    # in your controller....
    # @average_sadness_happiness = Mood.average_happiness(current_user)
  end
  def self.average_calmness(user)
    total_calmness = 0
    tatal_angryness = 0
    @all_moods = current_user.moods.select {|mood| (mood.created_at - Date.today).to_i <= 7}

    @all_moods.each  do |mood|

      @total_calmness += mood.angry_calm
      @total_angryness += 10 - mood.angry_calm
   end
      @average_calmness = @total_calmness / @all_moods.count
      @average_angryness = @total_angryness / @all_moods.count

     return {average_calmness: @average_calmness, average_angryness: @average_angryness}
  end
  def self.average_highenergy(user)
    total_highenergy = 0
    tatal_lowenergy = 0
    @all_moods = current_user.moods.select {|mood| (mood.created_at - Date.today).to_i <= 7}

    @all_moods.each  do |mood|

      @total_highenergy += mood.lowenergy_highenergy
      @total_lowenergy += 10 - mood.lowenergy_highenergy
   end
      @average_highenergy = @total_highenergy / @all_moods.count
      @average_lowenergy = @total_lowenergy / @all_moods.count

     return {average_highenergy: @average_highenergy, average_lowenergy: @average_lowenergy}
  end
  def self.average_socialness(user)
    total_socialness = 0
    tatal_anxiousness = 0
    @all_moods = current_user.moods.select {|mood| (mood.created_at - Date.today).to_i <= 7}

    @all_moods.each  do |mood|

      @total_socialness += mood.anxious_social
      @total_anxiousness += 10 - mood.anxious_social
   end
      @average_socialness = @total_socialness / @all_moods.count
      @average_anxiousness = @total_anxiousness / @all_moods.count

     return {average_socialness: @average_socialness, average_anxiousness: @average_anxiousness}
  end
end

# in your controller....
    # @average_sadness_happiness = Mood.average_happiness(current_user)

