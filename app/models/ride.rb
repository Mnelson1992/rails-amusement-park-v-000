class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction


  def take_ride
    user = User.find_by_id(self.user_id)
    attraction = Attraction.find_by_id(self.attraction_id)

    if !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets && !tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
       user.nausea += attraction.nausea_rating
       user.happiness += attraction.happiness_rating
       user.save
       return "Thanks for riding the #{attraction.name}!"
     end
  end


  def enough_tickets
    user.tickets >= attraction.tickets
  end

  def tall_enough
    user.height >= attraction.min_height
  end
end
