View.Item = React.createClass
  displayName: 'Item'

  getDefaultProps: ->
    style: {}
    item: {}
    keyIndex: 0

  getInitialState: ->
    item: @props.item

  render: ->
    R.section
      className: 'item'
      style: Styles.Item.Main
      @_renderItemContent()

  _renderItemContent: ->
    R.div
      className: 'item__content'
      style: Styles.Item.Content
      @state.item.content

View.Item = Radium(View.Item)
