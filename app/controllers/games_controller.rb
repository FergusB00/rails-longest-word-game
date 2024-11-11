class GamesController < ApplicationController
  def new
    @alphabet = ('a'..'z').to_a
    @letters = (Array.new(10) { @alphabet.sample })
  end

  def score
    raise
  end
end
