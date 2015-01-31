class Camera
	_camera = null
	_scene = null

	constructor: () ->
		ratio = (window.innerWidth * 0.7) / window.innerHeight
		_camera = new THREE.PerspectiveCamera( 75, ratio, 1, 500 )
		_camera.updateProjectionMatrix()
		_camera.position.z = 20

		light = new THREE.PointLight(0xffffff, 1, 200)
		light.position.set(50, 0, 10)
		_camera.add(light)

		light = new THREE.PointLight(0xffffff, 1, 200)
		light.position.set(0, 50, 10)
		_camera.add(light)

		light = new THREE.PointLight(0xffffff, 1, 200)
		light.position.set(0, 0, 60)
		_camera.add(light)
		
		window.addEventListener('resize', _onWindowResize, false)

	setScene : (scene) ->
		_scene = scene

	position : () -> 
		_camera.position

	visibleObjects : () -> 
		_scene.children()

	prepareScene : () -> 
		_scene.prepare()

	addToScene : (mesh) ->
		_scene.add(mesh)

	removeFromScene : (mesh) ->
		_scene.remove(mesh)

	_onWindowResize = () =>
		_camera.aspect = (window.innerWidth * 0.7) / window.innerHeight
		_camera.updateProjectionMatrix()

	getThree : () -> _camera

window.Camera = Camera;