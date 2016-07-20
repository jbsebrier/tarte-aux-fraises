class CouplesController < ApplicationController
before_action :set_couple, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @couple.update(couple_params)
    redirect_to couple_profile_path(@couple)
  end

  private

  def set_couple
    @couple = Couple.find(params[:id])
  end

  def couple_params
    params.require(:couple).permit(:email, :member1_name, :member2_name, :about_member1, :about_member2, :age_member_1, :age_member_2, :gender_member_1, :gender_member_2, :about_couple, :couple_nickname, :couple_city)
  end

end
