class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :position, :created_at

  def created_at
    object.created_at.strftime('%e-%b-%y')
  end
end
