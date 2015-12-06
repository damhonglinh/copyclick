list = {}
items = []
editingItem = {}
displayItemForm = false

ReactStore.ListDetailStore = $.extend ReactStore.ListDetailStore,
  initialize: _.once (data, callback = $.noop) ->
    list = data.list
    items = data.items
    editingItem = data.editingItem
    displayItemForm = data.displayItemForm
    @addChangeListener(callback)

  showItemFormFor: ({ id, content }) ->
    displayItemForm = true
    editingItem = { id: id, content: content }
    @emitChange()

  createOrUpdateItem: ({ id, content }) ->
    item = @._findItemById(id) || @_createNewItem(content)
    item.content = content
    @emitChange()

  hideForm: ->
    displayItemForm = false
    editingItem = {}
    @emitChange()

  getAllData: ->
    list: list
    items: items
    editingItem: editingItem
    displayItemForm: displayItemForm

  #private

  _createNewItem: (content) ->
    item =
      id: -1
      content: content
    items.push(item)
    item

  _findItemById: (itemId) ->
    _.find items, (item) ->
      item.id == itemId
