window.R = React.DOM
window.DragSource = DnD.DragSource
window.DropTarget = DnD.DropTarget
window.DragDropContext = DnD.DragDropContext

window.ReactStore ||= {}
window.ReactAction ||= {}
window.ReactServices ||= {}
window.ReactUtils ||= {}
window.Styles ||= {}

# https://github.com/callemall/material-ui/blob/ce15989f247f2b5971f6fa0bb080c5beed6dd3d6/docs/src/app/app.jsx#L10
injectTapEventPlugin()

Actions = [
  'showItemFormFor'
  'createOrUpdateItem'
  'hideForm'
]

new Fluxerator('ListDetail', Actions).generate().populate()
