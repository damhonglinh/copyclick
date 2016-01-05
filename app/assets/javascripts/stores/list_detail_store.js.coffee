list = {}
items = []
editingItem = {}
displayItemForm = false
message = ''
type = ''

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
    @_createOrUpdateItemOnServer(id, content)

  hideForm: ->
    displayItemForm = false
    editingItem = {}
    @emitChange()

  displayNotification: (messageOptions) ->
    message = messageOptions.message
    type    = messageOptions.type
    @emitChange()

  copyItemContent: ({ itemContentDOM }) ->
    if @_copyItemContentToClipboard(itemContentDOM)
      message = 'Copied!'
      type = 'success'
    else
      message = 'Cannot copy with Safari. Please press Ctrl + C to copy!'
      type = 'fail'
    @emitChange()

  getAllData: ->
    list: list
    items: items
    editingItem: editingItem
    displayItemForm: displayItemForm
    message: message
    type: type

  #private

  AJAX_PARAMS =
    url: '/items/create_or_update'
    contentType: 'application/json'
    method: 'POST'
    dataType: 'json'

  _createOrUpdateItemOnServer: (id, content) ->
    $.ajax $.extend {}, AJAX_PARAMS,
      data: JSON.stringify
        id: id
        list_id: list.id
        content: content
      success: (response) =>
        @_createNewItemOnServerSuccessCallback(response)

  _createNewItemOnServerSuccessCallback: (response) ->
    item = response.item
    if existingItem = @_findItemById(item.id)
      existingItem.content = item.content
    else
      items.push(item)
    @emitChange()

  _findItemById: (itemId) ->
    _.find items, (item) ->
      item.id == itemId

  _copyItemContentToClipboard: (itemContentDOM) ->
    try
      selection = window.getSelection()
      range = document.createRange()
      range.selectNodeContents(itemContentDOM)
      selection.removeAllRanges()
      selection.addRange(range)
      didCopySuccess = document.execCommand('copy')
      selection.removeAllRanges()
      didCopySuccess
    catch error
      return false
