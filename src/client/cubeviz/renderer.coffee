class Renderer
	_canvas = null
	_renderLock = false
	_renderer = null

	constructor: (@camera) ->
		window.rendererInstance = @
		_canvas = document.getElementById("canvas")
		
		_renderer = new THREE.WebGLRenderer({ 
			antialias: true
			canvas: _canvas
		})
		_renderer.setClearColor(new THREE.Color("#000000"))
		_renderer.setSize( window.innerWidth * 0.7, window.innerHeight )
		
		window.addEventListener('resize', _onWindowResize, false)

	_onWindowResize = () ->
		_renderer.setSize( window.innerWidth * 0.7, window.innerHeight )
		window.rendererInstance.render()

	width : () ->
		_canvas.width

	height : () ->
		_canvas.height

	offsetX : () ->
		_canvas.offsetLeft

	offsetY : () ->
		_canvas.offsetTop

	render: () ->
		if not _renderLock
			_renderLock = true

			#Needs THREE
			_renderer.render(@camera.prepareScene(), @camera.getThree())

			_renderLock = false
			requestAnimationFrame(window.rendererInstance.render)

window.Renderer = Renderer
window.rendererInstance