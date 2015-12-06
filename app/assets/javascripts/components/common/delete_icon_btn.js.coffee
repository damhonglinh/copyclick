View.DeleteIconBtn = React.createClass
  displayName: 'DeleteIconBtn'

  getDefaultProps: ->
    onClick: $.noop
    style: {}

  render: ->
    React.createElement FontIcon,
      className: 'material-icons detele-icon-btn'
      onClick: @_onClickInternal
      style: @props.style
      color: Styles.Utils.primaryColor
      hoverColor: Styles.Utils.primaryColorLight
      'delete'

  _onClickInternal: (event) ->
    @props.onClick(event)
