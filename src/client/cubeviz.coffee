onMouseClick = (e) ->
	window.voxelGlow.stopGlow()
	intersects = raycaster.getIntersected()

	if intersects.length
		voxel = window.meshToVoxels[intersects[0].object.name]
		dataDisplay.display(voxel)
		window.voxelGlow.glowAt(intersects[0].object.position)

init = () ->
	window.burstFactor = 0.3
	window.meshToVoxels = {}

	data = new DataParser().parse(window.data, window.axis)
	window.dataDisplay = new DataDisplay(window.metadata, window.axis)

	window.camera = new Camera()
	window.controls = new THREE.OrbitControls(window.camera.getThree())

	window.voxelGlow = new VoxelGlow(window.camera, window.controls)
	window.renderer = new Renderer(window.camera)
	window.raycaster = new Raycaster(window.renderer)
	window.scene = new Scene(data, voxelGlow, raycaster, camera)

	window.addEventListener("dblclick", onMouseClick, false)
	window.renderer.render()

window.addEventListener("load", init)