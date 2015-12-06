View.Lists.Main = React.createClass
  getDefaultProps: ->
    {}

  getInitialState: ->
    {}

  render: ->
    R.article
      className: 'lists-page'
      style: Styles.Lists.Page
      'Lists'
