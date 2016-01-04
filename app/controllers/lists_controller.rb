class ListsController < ApplicationController

  def index
   @lists = List.all
  end

  def show
    list = ListServices::FirstOrCreateByHandle.new(handle: params[:id]).find_or_create
    @data = {
      data: ListServices::ListJsonBuilder.build(list: list)
    }
  end

  def update
    respond_to_create_or_update
  end

  private

  def respond_to_create_or_update
    respond_to do |format|
      format.json do
        list = List.find_by_id(params[:id]) || List.new
        if list.update(list_params)
          render status: :ok
        else
          render status: :unprocessable_entity
        end
      end
    end
  end

  def list_params
    params.permit(:title)
  end
end
