itemMaxHeight = 300

Styles.Item =
  Main:
    width: '100%'
    maxHeight: itemMaxHeight
    overflow: 'hidden'
    borderBottom: Styles.Utils.borderStyle
    cursor: 'pointer'
    ':hover':
      backgroundColor: Styles.Utils.backgroundColorLight

  Content:
    lineHeight: 1.4
    maxHeight: itemMaxHeight - 30
    margin: 15
    overflow: 'hidden'
