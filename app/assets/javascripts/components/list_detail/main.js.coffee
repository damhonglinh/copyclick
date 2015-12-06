View.ListDetail.Main = React.createClass
  getDefaultProps: ->
    data: {}

  getInitialState: ->
    list: @props.data.list
    items: @props.data.items
    editingItem: {}
    displayItemForm: false
    clipboard: @_setupClipboard()
    message: ''
    type: ''

  componentWillUnmount: ->
    @state.clipboard.destroy()

  render: ->
    R.article
      className: 'list-detail'
      style: Styles.ListDetail.Page
      @_renderPageHeader()
      @_renderAddItemBtn()
      @_renderBody()
      @_renderNotification()
      @_renderItemForm() unless $.isEmptyObject(@state.editingItem)

  _renderPageHeader: ->
    React.createElement View.Common.PageHeader,
      title: @state.list.title

  _renderAddItemBtn: ->
    React.createElement FloatingActionButton,
      style: Styles.FloatingAddBtn
      iconStyle: Styles.FloatingAddBtnIcon
      '+'

  _renderBody: ->
    React.createElement View.ListDetail.ItemsContainer,
      items: @state.items

  _renderNotification: ->
    React.createElement View.Notification,
      message: @state.message
      type: @state.type

  _setupClipboard: ->
    clipboard = new Clipboard '.item',
      text: (trigger) ->
        $(trigger).find('.item__content').text()

    clipboard.on 'success', (event) =>
      @_displayCopiedSuccessMessage()

    clipboard.on 'error', (event) =>
      @_displayCopiedFailedMessage()

    clipboard

  _displayCopiedSuccessMessage: ->
    @setState
      message: 'Copied successfully!'
      type: 'success'

  _displayCopiedFailedMessage: ->
    @setState
      message: 'Cannot copy. Please press Ctrl + C to copy!'
      type: 'fail'

  _renderItemForm: ->
    React.createElement View.ItemForm,
      item: @state.editingItem
      isShowing: @state.displayItemForm
