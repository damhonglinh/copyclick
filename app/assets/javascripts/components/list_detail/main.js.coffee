View.ListDetail.Main = React.createClass
  getDefaultProps: ->
    data: {}

  getInitialState: ->
    list: @props.data.list
    items: @props.data.items
    editingItem: {}
    displayItemForm: false
    message: ''
    type: ''

  componentWillMount: ->
    ReactStore.ListDetailStore.initialize(@state, @_onStoreDataChanged)

  render: ->
    R.article
      className: 'list-detail'
      style: Styles.ListDetail.Page
      @_renderPageHeader()
      @_renderAddItemBtn()
      @_renderBody()
      @_renderNotification() if @state.message
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
      numberOfColumns: Styles.Utils.getNumberOfColumnsToDisplay()

  _renderNotification: ->
    React.createElement View.Notification,
      message: @state.message
      type: @state.type

  _renderItemForm: ->
    React.createElement View.ItemForm,
      item: @state.editingItem

  _onStoreDataChanged: ->
    @setState(ReactStore.ListDetailStore.getAllData())

  _handleClickAddItemBtn: (event) ->
    ReactAction.ListDetailAction.showItemFormFor({})
