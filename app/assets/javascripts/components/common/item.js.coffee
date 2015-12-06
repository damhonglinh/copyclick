View.Item = React.createClass
  getDefaultProps: ->
    style: {}
    item: {}

  getInitialState: ->
    item: @props.item

  render: ->
    R.section
      className: 'item'
      @state.item.content
