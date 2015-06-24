class MatchesController < ApplicationController
  def index
    @awaiting_approval = awaiting_approval
    @possible_match = next_possibility
  end
end
