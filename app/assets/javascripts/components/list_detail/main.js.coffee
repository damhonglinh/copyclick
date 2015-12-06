View.ListDetail.Main = React.createClass
  getDefaultProps: ->
    data: {}

  getInitialState: ->
    list: @props.data.list
    items: @props.data.items

  render: ->
    R.article
      className: 'list-detail-page'
      style: Styles.ListDetail.Page
      @_renderPageHeader()
      @_renderAddItemBtn()
      @_renderBody()

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
