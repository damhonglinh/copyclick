itemMaxHeight = 300
itemContentMargin = 30

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
    maxHeight: itemMaxHeight - itemContentMargin * 2
    margin: itemContentMargin
    overflow: 'hidden'
