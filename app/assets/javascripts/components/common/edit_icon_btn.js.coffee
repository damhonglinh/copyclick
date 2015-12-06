View.EditIconBtn = React.createClass
  displayName: 'EditIconBtn'

  getDefaultProps: ->
    onClick: $.noop
    style: {}

  render: ->
    React.createElement FontIcon,
      className: 'material-icons edit-icon-btn'
      onClick: @_onClickInternal
      style: @props.style
      color: Styles.Utils.primaryColor
      hoverColor: Styles.Utils.primaryColorLight
      'mode_edit'

  _onClickInternal: (event) ->
    @props.onClick(event)
