require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @alphabet = ('a'..'z').to_a
    @letters = (Array.new(10) { @alphabet.sample })
  end

  def score
    @word = params[:word]
    @word_array = @word.chars
    @url = "https://dictionary.lewagon.com/#{@word}"
    @valid_word_serialized = URI.parse(@url).read
    @valid_word = JSON.parse(@valid_word_serialized)
    @letters = params[:letters].gsub(' ', '').chars
    if !@word_array.all? { |letter| @letters.include?(letter) && @word_array.count(letter) <= @letters.count(letter)}
      @response = "Sorry but #{@word} can't be built out of #{@letters.join(' ').upcase}"
    elsif @valid_word["found"] == 'false'
      @response = "Sorry but #{@word} does not seem to be a valid English word..."
    else
      @response = "Congratulations! #{@word} is a valid English word!"
    end
  end
end
