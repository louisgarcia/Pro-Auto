class JobsController < ApplicationController
  def create
    @work_order = WorkOrder.find(params[:work_order_id])
    @job = @work_order.jobs.create(params[:job])
    redirect_to work_order_path(@work_order)
  end
end
