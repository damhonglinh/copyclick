View.ItemForm = Radium React.createClass
  displayName: 'ItemForm'

  getDefaultProps: ->
    item: {}

  getInitialState: ->
    itemId: @props.item.id
    itemContent: @props.item.content

  componentWillReceiveProps: (newProps) ->
    @setState(itemId: newProps.item.id, itemContent: newProps.item.content)

  componentDidMount: ->
    @refs.ItemContentInput.focus()
    $('body').addClass('no-scroll')

  componentWillUnmount: ->
    $('body').removeClass('no-scroll')

  render: ->
    R.article
      className: 'item-form-container'
      ref: 'ItemFormContainer'
      style: Styles.ItemForm.Container
      onClick: @_onClickWrapper
      @_renderFormContent()

  _renderFormContent: ->
    R.div
      className: 'item-form-wrapper'
      style: Styles.ItemForm.Wrapper
      R.section
        ref: 'ItemFormMain'
        className: 'item-form'
        style: Styles.ItemForm.Main
        @_renderContentInput()
        @_renderSaveChangeBtn()

  _renderContentInput: ->
    React.createElement TextField,
      ref: 'ItemContentInput'
      style: Styles.ItemForm.ContentField
      floatingLabelStyle: color: Styles.Utils.primaryColor
      underlineFocusStyle: borderColor: Styles.Utils.primaryColor
      fullWidth: true
      multiLine: true
      rowsMax: 15
      floatingLabelText: 'Just type anything'
      value: @state.itemContent
      onChange: @_handleContentChange

  _renderSaveChangeBtn: ->
    React.createElement RaisedButton,
      primary: true
      style: Styles.ItemForm.SaveBtn
      label: 'Done'
      onTouchTap: @_saveChange

  _handleContentChange: (event) ->
    @setState(itemContent: event.target.value)

  _saveChange: (event) ->
    ReactAction.ListDetailAction.createOrUpdateItem(id: @state.itemId, content: @state.itemContent)
    @_hideForm()

  _onClickWrapper: (event) ->
    @_hideForm() if event.target == @refs['ItemFormContainer']

  _hideForm: ->
    ReactAction.ListDetailAction.hideForm()
