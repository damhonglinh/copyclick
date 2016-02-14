module ListServices
  class ListJsonBuilder

    def initialize(options = {})
      @list = options[:list]
    end

    def build
      { list:  build_list_json,
        items: build_items_of_list_json }
    end

    def self.build(options = {})
      new(options).build
    end

    def build_list_json
      Hash(ListSerializer.new(@list).serializable_hash)
    end

    def build_items_of_list_json
      return [] unless @list.present?
      @list.items.order(created_at: :desc).map do |item|
        Hash(ItemSerializer.new(item).serializable_hash)
      end
    end

  end
end
