class MatchesController < ApplicationController
  def index
    @possible_match = next_possibility
  end
end
