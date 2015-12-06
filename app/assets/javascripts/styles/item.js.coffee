itemMaxHeight = 300
itemContentMargin = 35

Styles.Item =

  Main: $.extend {}, Styles.Utils.materialPaper,
    position: 'relative'
    margin: '25px 0'
    overflow: 'hidden'
    cursor: 'pointer'
    ':hover':
      backgroundColor: Styles.Utils.backgroundColorLight

  Content:
    lineHeight: 1.4
    maxHeight: itemMaxHeight - itemContentMargin * 2
    margin: itemContentMargin
    overflow: 'hidden'

  BtnWrapper:
    position: 'absolute'
    bottom: 3
    right: 3