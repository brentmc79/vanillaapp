class OrderingsController < ApplicationController

  before_filter :find_list

  def create
    @ordering = Ordering.new(params[:ordering])

    respond_to do |format|
      if @ordering.save
        format.html { redirect_to @list, notice: 'Done.' }
        format.json { render status: 200, location: @list }
      else
        format.html { redirect_to :back, error: 'There was a problem. Please try again.' }
        format.json { render json: @ordering.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_list
    @list = current_user.list.find(params[:list_id])
  end
end
