View.Common.PageHeader = React.createClass
  getDefaultProps: ->
    title: ''
    onTitleTouchTap: $.noop
    style: {}

  render: ->
    React.createElement AppBar,
      style: Styles.PageHeader
      title: @props.title
      showMenuIconButton: false
      onTitleTouchTap: @props.onTitleTouchTap
