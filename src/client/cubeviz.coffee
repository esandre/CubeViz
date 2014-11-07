initControls = () ->
	window.addEventListener('DOMMouseScroll', onMouseWheel, true)
	window.addEventListener('resize', render, false)
	window.addEventListener("mousemove", onMouseMove, false)
	window.addEventListener("dblclick", onMouseClick, false)
	new THREE.OrbitControls( window.camera )

initVoxels = (data) ->
	maxX = 0
	maxY = 0
	maxZ = 0

	for entry in data
		maxX = entry.x if entry.x > maxX
		maxY = entry.y if entry.y > maxY
		maxZ = entry.z if entry.z > maxZ

	maxX = (maxX + ((maxX - 1) * burstFactor)) / 2
	maxY = (maxY + ((maxY - 1) * burstFactor)) / 2
	maxZ = (maxZ + ((maxZ - 1) * burstFactor)) / 2

	voxels = []
	for entry in data
		material = new THREE.MeshPhongMaterial({
			color: new THREE.Color("rgb(#{entry.r}, #{entry.v}, #{entry.b})")
		})

		mesh = new THREE.Mesh(new THREE.BoxGeometry(1,1,1), material )
		mesh.position.x = entry.x * (1 + burstFactor) - maxX
		mesh.position.y = entry.y * (1 + burstFactor) - maxY
		mesh.position.z = entry.z * (1 + burstFactor) - maxZ
		mesh.name = entry.x + '-' + entry.y + '-' + entry.z

		voxel = {
			data: entry.data
			x: entry.x
			y: entry.y
			z: entry.z
			r: entry.r
			v: entry.v
			b: entry.b
			mesh: mesh
		}

		voxels.push(voxel)
		window.meshToVoxels[mesh.name] = voxel

		window.scene.add(mesh)

	voxels

window.renderLock = false
render = () ->
	if !window.renderLock
		window.renderLock = true

		drawVoxel voxel for voxel in window.voxels
		onMouseMove(null)
		window.renderer.render(window.scene, window.camera)

		window.renderLock = false
		requestAnimationFrame(render)

drawVoxel = (voxel) ->
	mesh = voxel.mesh
	distance = mesh.position.distanceTo(window.camera.position)
	if distance < 10 
		scene.remove(mesh)
	else
		scene.add(mesh)

window.previousKnownMousePos = {clientX: 0, clientY: 0}
onMouseMove = (e) ->
	if e == null 
		e = window.previousKnownMousePos
	else 
		window.previousKnownMousePos = e

	intersects = raycaster.getIntersected(e)

	if intersects.length
		window.voxelGlow.glowAt(intersects[0].object.position)
	else
		window.voxelGlow.stopGlow()

onMouseClick = (e) ->
	window.voxelGlow.stopGlow()
	intersects = raycaster.getIntersected(e)

	if intersects.length
		voxel = window.meshToVoxels[intersects[0].object.name]
		dataDisplay.display(voxel)
		window.voxelGlow.glowAt(intersects[0].object.position)

window.suspendTimer = null
onMouseWheel = (e) ->
	clearTimeout(suspendTimer) if suspendTimer?
	window.voxelGlow.pauseGlow()
	window.voxelGlow.stopGlow()

	suspendTimer = window.setTimeout(window.voxelGlow.resumeGlow, 100)
	window.controls.update()

parseData = (data, axis) ->
	_x = _y = _z = 0
	x_axis_translation = {}
	y_axis_translation = {}
	z_axis_translation = {}
	r_min = v_min = b_min = 255
	r_max = v_max = b_max = 0
	output = []

	for entry in data
		r = r_min
		r = entry[axis.r] if axis.r != null

		v = v_min
		v = entry[axis.v] if axis.v != null

		b = b_min
		b = entry[axis.b] if axis.b != null

		x_axis_translation[entry[axis.x]] = _x++ if not x_axis_translation[entry[axis.x]]?
		y_axis_translation[entry[axis.y]] = _y++ if not y_axis_translation[entry[axis.y]]?
		z_axis_translation[entry[axis.z]] = _z++ if not z_axis_translation[entry[axis.z]]?
		r_min = r if r < r_min
		v_min = v if v < v_min
		b_min = b if b < b_min
		r_max = r if r > r_max
		v_max = v if v > v_max
		b_max = b if b > b_max

	for entry in data
		r = 0
		r = entry[axis.r] if axis.r != null

		v = 0
		v = entry[axis.v] if axis.v != null

		b = 0
		b = entry[axis.b] if axis.b != null

		output.push({
			data: {
				x: entry[axis.x]
				y: entry[axis.y]
				z: entry[axis.z]
				r: entry[axis.r]
				v: entry[axis.v]
				b: entry[axis.b]
			}
			x: x_axis_translation[entry[axis.x]]
			y: y_axis_translation[entry[axis.y]]
			z: z_axis_translation[entry[axis.z]]
			r: Math.floor(((r - r_min) / (r_max + 1)) * 255) % 255
			v: Math.floor(((v - v_min) / (v_max + 1)) * 255) % 255
			b: Math.floor(((b - b_min) / (b_max + 1)) * 255) % 255
		})

	output

init = () ->
	window.burstFactor = 0.3
	window.meshToVoxels = {}

	window.scene = new Scene().scene
	window.canvas = new Canvas("canvas").domElement
	window.camera = new Camera(window.scene).camera
	window.renderer = new Renderer(window.canvas, window.scene).renderer
	window.raycaster = new Raycaster(scene, canvas, camera)
	window.dataDisplay = new DataDisplay(window.metadata, window.axis)

	window.voxelGlow = new VoxelGlow(window.camera, window.scene)
	window.addEventListener('mousedown', window.voxelGlow.pauseGlow, false)
	window.addEventListener('mouseup', window.voxelGlow.resumeGlow, false)

	window.controls = initControls()
	window.voxels = initVoxels(parseData(window.data, window.axis))

	render()

window.addEventListener("load", init)