View.ListDetail.Main = React.createClass
  getDefaultProps: ->
    data: {}

  getInitialState: ->
    clipboard: @_setupClipboard()
    list: @props.data.list
    items: @props.data.items
    editingItem: {}
    displayItemForm: false
    message: ''
    type: ''

  componentWillMount: ->
    ReactStore.ListDetailStore.initialize(@state, @_onStoreDataChanged)

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
      @_renderItemForm() if @state.displayItemForm

  _renderPageHeader: ->
    React.createElement View.Common.PageHeader,
      title: @state.list.title

  _renderAddItemBtn: ->
    React.createElement FloatingActionButton,
      style: Styles.FloatingAddBtn
      iconStyle: Styles.FloatingAddBtnIcon
      onTouchTap: @_handleClickAddItemBtn
      '+'

  _renderBody: ->
    React.createElement View.ListDetail.ItemsContainer,
      items: @state.items
      numberOfColumns: @_getNumberOfColumnsToDisplay()

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
      message: 'Copied!'
      type: 'success'

  _displayCopiedFailedMessage: ->
    @setState
      message: 'Cannot copy with Safari. Please press Ctrl + C to copy!'
      type: 'fail'

  _renderItemForm: ->
    React.createElement View.ItemForm,
      item: @state.editingItem

  _onStoreDataChanged: ->
    @setState(ReactStore.ListDetailStore.getAllData())

  _handleClickAddItemBtn: (event) ->
    ReactAction.ListDetailAction.showItemFormFor({})

  _getNumberOfColumnsToDisplay: ->
    width = $(window).width()
    if width <= 414
      1
    else if width < 600
      2
    else
      3
