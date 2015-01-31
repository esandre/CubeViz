class Raycaster
	_raycaster = null
	_renderer = null
	_mouse_vector = new THREE.Vector2(0, 0)

	constructor: (renderer) ->
		_renderer = renderer
		_raycaster = new THREE.Raycaster()

		window.addEventListener("mousemove", _onMouseMove, false)

	getIntersected: () ->
		_raycaster.setFromCamera(_mouse_vector.clone(), _renderer.camera.getThree())
		_raycaster.intersectObjects(_renderer.camera.visibleObjects())

	_onMouseMove = (e) ->
		_mouse_vector.set(
			( e.clientX - _renderer.offsetX()) / _renderer.width() * 2 - 1,
            -( e.clientY - _renderer.offsetY() ) / _renderer.height() * 2 + 1
        )

window.Raycaster = Raycaster