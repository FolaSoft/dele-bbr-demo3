@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "workout_blocks/list/list_layout"

		regions:
			blocksRegion: "#blocks-region"

	class List.Block extends App.Views.ItemView
		template: "workout_blocks/list/_block"

	class List.Blocks extends App.Views.CompositeView
		template: "workout_blocks/list/_blocks"
		itemView: List.Block
		itemViewContainer: "#items"
