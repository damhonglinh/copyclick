View.ListDetail.Main = React.createClass
  getDefaultProps: ->
    data: {}

  getInitialState: ->
    list: @props.data.list
    items: @props.data.items
    clipboard: @_setupClipboard()
    message: ''
    type: ''

  componentWillUnmount: ->
    @state.clipboard.destroy()

  render: ->
    R.article
      className: 'list-detail-page'
      style: Styles.ListDetail.Page
      @_renderPageHeader()
      @_renderAddItemBtn()
      @_renderBody()
      @_renderNotification()

  _renderPageHeader: ->
    React.createElement View.Common.PageHeader,
      title: @state.list.title

  _renderAddItemBtn: ->
    React.createElement FloatingActionButton,
      style: Styles.FloatingAddBtn
      iconStyle: Styles.FloatingAddBtnIcon
      '+'

  _renderBody: ->
    R.section
      className: 'list-detail-page__body clearfix'
      @_renderItems()

  _renderItems: ->
    _.map @state.items, (item, index) ->
      React.createElement View.Item,
        keyIndex: index
        key: index
        item: item

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
