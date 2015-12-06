itemMaxHeight = 300
itemContentMargin = 35

Styles.ItemForm =

  Wrapper:
    position: 'absolute'
    top: 0
    left: 0
    height: '100vh'
    width: '100vw'
    backgroundColor: 'rgba(51, 51, 51, 0.5)'
    textAlign: 'center'

  Main: $.extend {}, Styles.Utils.middleAlignChildren, Styles.Utils.materialPaper,
    backgroundColor: 'white'
    padding: '30px 30px 50px 30px'
    height: '50%'
    width: '50%'
    '@media (max-width: 900px)':
      width: '80%'

  ContentField:
    textAlign: 'left'

  SaveBtn:
    position: 'absolute'
    bottom: 30
    right: 30

  BtnWrapper:
    position: 'absolute'
    bottom: 3
    right: 3
