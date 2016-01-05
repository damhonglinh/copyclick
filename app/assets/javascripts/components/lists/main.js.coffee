View.Lists.Main = Radium React.createClass
  getDefaultProps: ->
    data: []

  getInitialState: ->
    lists: @props.data

  render: ->
    R.article
      className: 'lists-page'
      style: Styles.Lists.Page
      @_renderAllLists()

  _renderAllLists: ->
    React.createElement List,
      className: 'lists-container'
      subheader: 'Recent Lists'
      _.map @state.lists, (list, index) =>
        @_renderEachList(list, index == 0)

  _renderEachList: (list, isFirst) ->
    style = $.extend({}, Styles.Lists.ListLine, isFirst && Styles.Lists.ListLineLast)

    React.createElement ListItem,
      className: 'list-line'
      primaryText: list.title
      style: style
      onTouchTap: (event) ->
        window.location.href = "/#{list.handle}"
