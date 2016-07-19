class CouplesController < ApplicationController

  def edit
    @couple = Couple.find(params[:id])
  end

end
