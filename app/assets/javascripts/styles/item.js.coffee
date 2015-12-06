Styles.Item =
  Main:
    width: '50%'
    height: 150
    overflow: 'hidden'
    borderBottom: Styles.Utils.borderStyle
    borderRight: Styles.Utils.borderStyle
    cursor: 'pointer'
    float: 'left'
    ':hover':
      backgroundColor: Styles.Utils.backgroundColorLight
  Content:
    lineHeight: 1.4
    height: 'calc(100% - 30px)'
    margin: 15
    overflow: 'hidden'
