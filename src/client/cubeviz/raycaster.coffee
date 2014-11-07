class Raycaster
	constructor: (@scene, @canvas, @camera) ->
		@raycaster = new THREE.Raycaster(new THREE.Vector3(0,0,0), new THREE.Vector3(0,0,0))
		@projector = new THREE.Projector()

	getIntersected: (event) ->
		mouse_x = ( event.clientX / @canvas.width ) * 2 - 1
		mouse_y = - ( event.clientY / @canvas.height ) * 2 + 1

		mouse_vector = new THREE.Vector3(mouse_x, mouse_y, 0.5)
		@projector.unprojectVector(mouse_vector, @camera)

		@raycaster.set(@camera.position, mouse_vector.sub(@camera.position).normalize())
		return @raycaster.intersectObjects(@scene.children)

window.Raycaster = Raycaster