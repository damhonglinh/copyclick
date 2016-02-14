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
      onClick: @_handleClickingItem
      @_renderItemContent()
      @_renderTimestamp()
      @_renderBtnWrapper()

  _renderBtnWrapper: ->
    R.div
      style: Styles.Item.BtnWrapper
      @_renderEditBtn()
      @_renderDeleteBtn()

  _renderDeleteBtn: ->
    React.createElement View.DeleteIconBtn,
      onClick: @_handleClickingDeleteBtn

  _renderEditBtn: ->
    React.createElement View.EditIconBtn,
      onClick: @_handleClickingEditBtn
      style: margin: '0 7px'

  _renderItemContent: ->
    R.div
      ref: 'ItemContent'
      className: 'item__content'
      style: Styles.Item.Content
      @state.item.content

  _renderTimestamp: ->
    R.span
      className: 'item__timestamp'
      style: Styles.Item.Timestamp
      @state.item.created_at

  _handleClickingItem: (event) ->
    ReactAction.ListDetailAction.copyItemContent(itemContentDOM: @refs.ItemContent)

  _handleClickingDeleteBtn: (event) ->
    event.stopPropagation()

  _handleClickingEditBtn: (event) ->
    event.stopPropagation()
    ReactAction.ListDetailAction.showItemFormFor(@state.item)

View.Item = Radium(View.Item)
