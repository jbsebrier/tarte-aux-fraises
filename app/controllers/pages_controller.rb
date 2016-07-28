class PagesController < ApplicationController
  skip_before_action :authenticate_couple!, only: :home

  def home
  end

  def challenges
  end



end
