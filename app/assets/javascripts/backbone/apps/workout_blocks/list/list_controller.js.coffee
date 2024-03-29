@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			workout = options.workout

			blocks = App.request "block:entities", workout

			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@listBlocks blocks

			@show @layout

		getLayoutView : ->
			new List.Layout

		listBlocks: (blocks) ->
			blocksView = @getBlocksView blocks

			@layout.listModelsRegion.show blocksView

			blocksView.children.each @handleLayout

		getBlocksView: (blocks) ->
			new List.Blocks
				collection: blocks

		handleLayout: (layout) =>
			@listModelRegion layout
			@listSubModelsRegion layout

		listModelRegion: (layout) ->
			listModelView = new List.Block(model: layout.model)
			layout.listModelRegion.show( listModelView )

		listSubModelsRegion: (layout) ->
			options =
				region: layout.listSubModelsRegion
				block: layout.model
			App.execute "show:block", options