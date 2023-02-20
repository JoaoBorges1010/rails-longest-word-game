require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    @word = params[:word]
    if wagon_dictionary["found"].to_s == "true"
      @exist = "You Win"
    else
      @exist = "You loose"
    end
  end

  def check_word
  end  

  def wagon_dictionary
    url = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    JSON.parse(url.read)
  end
end
