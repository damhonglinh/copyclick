class ListsController < ApplicationController

  def create
    respond_to_create_or_update
  end

  def update
    respond_to_create_or_update
  end

  private

  def respond_to_create_or_update
    respond_to do |format|
      format.json do
        item = Item.find_by_id(params[:id]) || Item.new
        if item.update(item_params)
          render status: :ok
        else
          render status: :unprocessable_entity
        end
      end
    end
  end

  def item_params
    params.permit(:content, :position, :list_id)
  end
end
