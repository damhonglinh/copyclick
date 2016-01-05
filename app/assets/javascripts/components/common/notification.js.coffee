View.Notification = React.createClass
  getDefaultProps: ->
    message: ''
    type: ''
    duration: 1500

  getInitialState: ->
    message: @props.message
    type: @props.type
    duration: @props.duration

  componentDidMount: (newProps) ->
    @refs.snackbar.show()

  componentWillReceiveProps: (newProps) ->
    @setState(message: newProps.message, type: newProps.type, duration: newProps.duration)
    @refs.snackbar.show() if newProps.message

  render: ->
    @_triggerHideNotification()

    React.createElement Snackbar,
      ref: 'snackbar'
      className: 'notification'
      open: true
      autoHideDuration: @state.duration
      message: @state.message

  _triggerHideNotification: ->
    setTimeout(->
      ReactAction.ListDetailAction.displayNotification(message: '', type: '')
    , @state.duration)
