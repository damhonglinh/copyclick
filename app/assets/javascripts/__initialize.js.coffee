window.R = React.DOM
window.DragSource = DnD.DragSource
window.DropTarget = DnD.DropTarget
window.DragDropContext = DnD.DragDropContext

window.ReactStore ||= {}
window.ReactAction ||= {}
window.ReactServices ||= {}
window.ReactUtils ||= {}
window.Styles ||= {}

Actions = [
  'createList'
  'createItem'
]

fluxerator = new Fluxerator('List', Actions)
fluxerator.generate().populate()
