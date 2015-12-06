View.ItemForm = Radium React.createClass
  displayName: 'ItemForm'

  getDefaultProps: ->
    item: {}
    isShowing: true

  getInitialState: ->
    itemId: @props.item.id
    itemContent: @props.item.content
    isShowing: @props.isShowing

  render: ->
    R.article
      className: 'item-form-wrapper'
      style: [Styles.ItemForm.Wrapper, !@state.isShowing && display: 'none']
      onClick: @_onClickWrapper
      @_renderFormContent()

  _renderFormContent: ->
    R.section
      ref: 'ItemFormMain'
      className: 'item-form'
      style: Styles.ItemForm.Main
      @_renderContentInput()
      @_renderSaveChangeBtn()

  _renderContentInput: ->
    React.createElement TextField,
      style: Styles.ItemForm.ContentField
      floatingLabelStyle: color: Styles.Utils.primaryColor
      underlineFocusStyle: borderColor: Styles.Utils.primaryColor
      fullWidth: true
      multiLine: true
      rowsMax: 7
      floatingLabelText: 'Content'
      value: @state.itemContent
      onChange: @_handleContentChange

  _renderSaveChangeBtn: ->
    React.createElement RaisedButton,
      primary: true
      style: Styles.ItemForm.SaveBtn
      label: 'Save'
      onTouchTap: @_saveChange

  _handleContentChange: (event) ->
    @setState(itemContent: event.target.value)

  _saveChange: (event) ->
    @_hideForm()

  _onClickWrapper: (event) ->
    @_hideForm() unless @refs['ItemFormMain'] == event.target

  _hideForm: ->
    console.log('hideform')
