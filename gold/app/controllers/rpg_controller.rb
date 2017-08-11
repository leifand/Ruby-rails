class RpgController < ApplicationController
  def random_gold(min, max)
    return rand(max-min) + min
  end
  def index
    # not much to see here! so cool ...
    session[:gold] ||= 0
    session[:activities] ||= []
  end

  def process_gold
    activity = params[:activity]
    activity_string = ""
    gold = 0;
    if activity == "farm"
      gold = random_gold 100, 200
      session[:gold] += gold
      activity_string = "You stole #{ gold } gold over at the farm!"
    elsif activity == "cave"
      gold = random_gold 50, 100
      session[:gold] += gold
      activity_string = "You threatened a hermit for #{ gold } gold in a cave!"
    elsif activity == "house"
      gold = random_gold 20, 50
      session[:gold] += gold
      activity_string = "You borrowed #{ gold } gold from a purse at a house!"
    elsif activity == "caisino"
      coin_toss = rand(2)
      if coin_toss == 1
        gold = random_gold 0, 500
        session[:gold] += gold
        activity_string = "Lady Luck graces you with #{ gold } gold, you so deserve it!"
      else
        gold = -1 * (random_gold 0, 500)
        session[:gold] += gold
        activity_string = "The corrupt caisino stole #{ gold } gold from you!!!"
      end
    else
        # do nothing
    end
    session[:activities].push(activity_string)
    redirect_to '/'
  end
end
