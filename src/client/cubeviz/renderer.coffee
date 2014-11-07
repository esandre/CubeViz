class Renderer
	constructor: (canvas, scene) ->
		@renderer = new THREE.WebGLRenderer({ 
			antialias: true
			canvas: canvas
		})
		@renderer.setClearColor(new THREE.Color("#000000"))
		@onWindowResize()

		window.addEventListener('resize', @onWindowResize, false)

	onWindowResize: () ->
		@renderer.setSize( window.innerWidth * 0.7, window.innerHeight )

window.Renderer = Renderer;