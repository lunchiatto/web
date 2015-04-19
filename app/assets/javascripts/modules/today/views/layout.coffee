@CodequestManager.module "Today", (Today, App, Backbone, Marionette, $, _) ->
  Today.Layout = Marionette.LayoutView.extend
    template: "today/layout"

    regions:
      orderButtons: ".order-buttons"
      order: ".order"

    behaviors:
      Animateable:
        types: ["fadeIn"]

    initialize: (options) ->
      @currentOrder = options.order

    onRender: ->
      @_showButtons()
      @showOrder(@currentOrder) if @currentOrder

    showOrder: (order) ->
      App.router.navigate "/orders/today/#{order.id}"
      order = new App.Entities.Order id: order.id
      order.fetch
        success: (order) =>
          view = new App.Order.Show model: order
          @order.show view

    _showButtons: ->
      buttons = new Today.OrderButtons collection: @collection, currentOrderId: @currentOrder.id
      buttons.on 'childview:select:order', (orderView) => @showOrder(orderView.model)
      @orderButtons.show buttons

