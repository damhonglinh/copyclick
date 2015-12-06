View.ListDetail.Main = React.createClass
  getDefaultProps: ->
    {}

  getInitialState: ->
    {}

  render: ->
    R.article
      className: 'list-detail-page'
      style: Styles.ListDetail.Page
      'ListDetail'
