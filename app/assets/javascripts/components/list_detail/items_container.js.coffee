View.ListDetail.ItemsContainer = React.createClass
  getDefaultProps: ->
    items: {}

  getInitialState: ->
    items: @props.items

  render: ->
    R.section
      className: 'list-detail__body clearfix'
      style: Styles.ListDetail.Body
      @_renderMiddleDivider()
      @_renderItemColumns()

  _renderMiddleDivider: ->
    R.div
      className: 'list-detail__middle-divider'
      style: Styles.ListDetail.MiddleDivider

  _renderItemColumns: ->
    columnsOfItems = @_prepareItemsInColumns(@state.items, 2)
    _.map columnsOfItems, (items, columnIndex) =>
      @_renderOneColumn(items, columnIndex)

  _renderOneColumn: (items, columnIndex) ->
    R.section
      className: 'list-detail__column'
      style: Styles.ListDetail.Column
      key: columnIndex
      @_renderItemsForOneColumn(items)

  _renderItemsForOneColumn: (items) ->
    _.map items, (item, index) ->
      React.createElement View.Item,
        keyIndex: index
        key: index
        item: item

  _prepareItemsInColumns: (items, numberOfColumns) ->
    _.reduce(items, (returnedList, item, index) ->
      columnIndex = index % numberOfColumns
      returnedList[columnIndex] ||= []
      returnedList[columnIndex].push(item)
      returnedList
    , {})
