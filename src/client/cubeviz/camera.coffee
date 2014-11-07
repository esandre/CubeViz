class Camera
	constructor: (scene) ->
		ratio = (window.innerWidth * 0.7) / window.innerHeight
		@camera = new THREE.PerspectiveCamera( 75, ratio, 1, 500 )
		@camera.updateProjectionMatrix()
		@camera.position.z = 20

		light = new THREE.PointLight(0xffffff, 1, 200)
		light.position.set(50, 0, 10)
		@camera.add(light)

		light = new THREE.PointLight(0xffffff, 1, 200)
		light.position.set(0, 50, 10)
		@camera.add(light)

		light = new THREE.PointLight(0xffffff, 1, 200)
		light.position.set(0, 0, 60)
		@camera.add(light)
		
		scene.add(@camera)
		window.addEventListener('resize', @onWindowResize, false)

	onWindowResize: () ->
		@camera.aspect = (window.innerWidth * 0.7) / window.innerHeight
		@camera.updateProjectionMatrix()

window.Camera = Camera;