View.Notification = React.createClass
  getDefaultProps: ->
    message: ''
    type: ''
    duration: 1500

  getInitialState: ->
    message: @props.message
    type: @props.type
    duration: @props.duration

  componentWillReceiveProps: (newProps) ->
    @setState(message: newProps.message, type: newProps.type, duration: newProps.duration)
    @refs.snackbar.show() if @state.message

  render: ->
    React.createElement Snackbar,
      ref: 'snackbar'
      autoHideDuration: @state.duration
      message: @state.message
