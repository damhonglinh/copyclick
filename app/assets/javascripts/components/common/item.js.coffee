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
      className: 'item__content'
      style: Styles.Item.Content
      @state.item.content

  _handleClickingDeleteBtn: (event) ->
    event.preventDefault()

  _handleClickingEditBtn: (event) ->
    event.preventDefault()

View.Item = Radium(View.Item)
