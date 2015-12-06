###
This file generates 3 main compenents of Flux:
  + dispatcher: there is only one dispatcher for the whole application
  + store
  + action

After calling new Fluxerator('ModelName').populate(), the 3 components are accessed via
  + dispatcher:  window.dispatcher
  + store:       window.ReactStore.ModelNameStore
  + action:      window.ReactAction.ModelNameAction

Example usage:
  window.fluxerator = new Fluxerator('Navigation', ['viewCategory'])
  fluxerator.generate().populate()

  # Implement window.ReactStore.NavigationStore.viewCategory
  window.ReactStore.NavigationStore.viewCategory = (params) ->
    console.log(params)

  # In View (React components), to trigger some action:
  ReactAction.NavigationAction.viewCategory(params)

  # In View (React components), add a callback to listen to data changed in ReactStore:
  window.ReactStore.NavigationStore.addChangeListener(callback)

###

window.FluxDispatcher = require('flux').Dispatcher
window.EventEmitter = require('events').EventEmitter

class window.Fluxerator
  constructor: (modelName, actionNames, dispatcher = null, storeMapping = null) ->
    @modelName    = modelName
    @actionNames  = actionNames
    @dispatcher   = dispatcher   || SingletonDispatcher.getDispatcher()
    @storeMapping = storeMapping || SingletonDispatcher.getStoreMapping()

  generate: ->
    @store  = _generateStore.apply(@)
    @action = _generateAction.apply(@)
    _extendStoreMapping.apply(@)
    @

  populate: ->
    ReactStore["#{@modelName}Store"] = @store
    ReactAction["#{@modelName}Action"] = @action

  # private

  _generateStore = ->
    $.extend(changeEventName: _changeEmittingEventNameFor(@modelName), EventEmitter.prototype, _reactStoreTemplate)

  _generateAction = ->
    _.reduce(@actionNames, (resultActionFunctions, actionName) =>
      resultActionFunctions[actionName] = _createDispatchFunction(@dispatcher, actionName, @modelName)
      resultActionFunctions
    , {})

  _extendStoreMapping = ->
    _.each @actionNames, (actionName) =>
      @storeMapping[_dispatchEventNameFor(@modelName, actionName)] = @store

  _createDispatchFunction = (dispatcher, actionName, modelName) ->
    actionTypeParams = actionType: _dispatchEventNameFor(modelName, actionName)
    (actionData) ->
      dispatcher.dispatch($.extend({}, actionData, actionTypeParams))

  _dispatchEventNameFor = (modelName, actionName) ->
    "#{modelName}##{actionName}"

  _changeEmittingEventNameFor = (modelName) ->
    "#{modelName}ChangeEvent"

  _reactStoreTemplate =
    emitChange: ->
      @emit(@changeEventName)

    addChangeListener: (callback) ->
      @addListener(@changeEventName, callback)

    removeChangeListener: (callback) ->
      @removeListener(@changeEventName, callback)


class window.SingletonDispatcher
  _dispatcher = null
  _storeMapping = null

  @getDispatcher: ->
    _dispatcher ?= _initializeDispatcher(@getStoreMapping())

  @getStoreMapping: ->
    _storeMapping ?= {}

  # private

  _initializeDispatcher = (storeMapping) ->
    dispatcher = new FluxDispatcher()
    dispatcher.register(_getDispatcherRegisteredFunction(storeMapping))
    dispatcher

  _getDispatcherRegisteredFunction = (storeMapping) ->
    (action) ->
      store    = storeMapping[action.actionType]
      callback = _getCallbackFromDispatcherAction(store, action)
      params   = _getCallbackParamsFromDispatcherAction(action)
      _invokeCallback(callback, params, store, action.actionType)

  _getCallbackFromDispatcherAction = (store, action) ->
    callbackName = action.actionType.split('#')[1]
    store[callbackName]

  _getCallbackParamsFromDispatcherAction = (action) ->
    _.omit(action, 'actionType')

  _invokeCallback = (callback, params, _this, actionName) ->
    throw "Action not found. Need to implement function: #{actionName}" unless typeof callback == 'function'
    callback.call(_this, params)
