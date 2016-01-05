class ListsController < ApplicationController
  http_basic_authenticate_with name: 'linh', password: 'chi', only: :index


  def index
    recent_lists = List.order(updated_at: :desc).first(100)
    @lists = recent_lists.map{ |list| Hash(ListSerializer.new(list).serializable_hash) }
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
          render json: { list: Hash(ListSerializer.new(list).serializable_hash) },
                 status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end
    end
  end

  def list_params
    params.permit(:title)
  end
end
