class Scene
	constructor: () ->
		@scene = new THREE.Scene()

		light = new THREE.AmbientLight(0x111111)
		@scene.add(light)

window.Scene = Scene;