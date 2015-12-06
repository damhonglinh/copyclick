View.ListDetail.ItemsContainer = Radium React.createClass
  getDefaultProps: ->
    items: {}
    numberOfColumns: 3

  getInitialState: ->
    items: @props.items
    numberOfColumns: @props.numberOfColumns

  componentWillReceiveProps: (newProps) ->
    @setState(items: newProps.items, numberOfColumns: newProps.numberOfColumns)

  render: ->
    R.section
      className: 'list-detail__body clearfix'
      style: Styles.ListDetail.Body
      @_renderItemColumns()

  _renderItemColumns: ->
    columnsOfItems = @_prepareItemsInColumns(@state.items, @state.numberOfColumns)
    _.map columnsOfItems, (items, columnIndex) =>
      @_renderOneColumn(items, columnIndex)

  _renderOneColumn: (items, columnIndex) ->
    R.section
      className: 'list-detail__column'
      style: @_columnStyle()
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

  _columnStyle: ->
    widthStyle = width: "#{100 / @state.numberOfColumns}%"
    [ Styles.ListDetail.Column, widthStyle ]
