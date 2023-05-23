require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters_random = []
    10.times { @letters_random << ('a'..'z').to_a.sample }
  end

  def score
    @input = params[:word]
    @letters = @letters_random
    @is_english = is_english?(@input)
    @is_included = is_included?(@input, @letters)
  end

  def is_english?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_search = URI.open(url).read
    word_results = JSON.parse(word_search)
    word_results['found']
  end

  def is_included?(word, letters)

  end
end
