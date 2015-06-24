class MatchesController < ApplicationController
  before_action :authorize!, only: [:index]
  def index
    @awaiting_approval = awaiting_approval
    @possible_match = next_possibility
  end
end
