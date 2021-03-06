itemMaxHeight = 300
itemContentMargin = 35

Styles.ItemForm =

  Container:
    position: 'fixed'
    top: 0
    left: 0
    bottom: 0
    right: 0
    backgroundColor: 'rgba(51, 51, 51, 0.5)'
    textAlign: 'center'
    WebkitTransform: 'translate3d(0,0,0)'


  Wrapper: $.extend {}, Styles.Utils.middleAlignChildren, Styles.Utils.materialPaper,
    backgroundColor: 'white'
    padding: 16
    height: '70%'
    width: '70%'
    '@media (max-width: 600px)':
      width: '90%'
      padding: 16

  Main:
    position: 'relative'
    width: '100%'
    height: '100%'

  ContentField:
    textAlign: 'left'

  Label:
    fontSize: 13

  SaveBtn:
    position: 'absolute'
    bottom: 0
    right: 0
