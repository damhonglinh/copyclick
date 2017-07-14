class ItemsController < ApplicationController

  def create
    respond_to_create_or_update
  end

  def update
    respond_to_create_or_update
  end

  def create_or_update
    respond_to_create_or_update
  end

  private

  def respond_to_create_or_update
    respond_to do |format|
      format.json do
        item = Item.find_by_id(params[:id]) || Item.new
        if item_params[:content].present? && item.update(item_params)
          render json: { item: Hash(ItemSerializer.new(item).serializable_hash) },
                 status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end
    end
  end

  def item_params
    params.permit(:content, :position, :list_id)
  end
end
