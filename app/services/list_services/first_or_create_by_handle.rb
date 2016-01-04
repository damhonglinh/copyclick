module ListServices
  class FirstOrCreateByHandle

    MAX_HANDLE_LENGTH = 150

    def initialize(options = {})
      @handle = normalize_handle(options[:handle])
    end

    def find_or_create
      list = List.where(handle: @handle).first_or_create
      list.update(title: @handle.titlecase)
      list
    end

    private

    def normalize_handle(handle)
      handle.first(MAX_HANDLE_LENGTH).parameterize
    end

  end
end
