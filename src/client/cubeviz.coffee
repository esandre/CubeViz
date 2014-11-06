initCamera = () ->
	camera = new THREE.PerspectiveCamera( 75, (window.innerWidth * 0.7) / window.innerHeight, 1, 500 )
	camera.position.z = 20
	camera.name = "camera"
	scene.add(camera)
	camera

initRenderer = () ->
	renderer = new THREE.WebGLRenderer({ 
		antialias: true
		canvas: window.canvas
	})
	renderer.setSize( window.innerWidth * 0.7, window.innerHeight )
	renderer.setClearColor(new THREE.Color("#000000"))
	renderer

initLights = () ->
	light = new THREE.PointLight(0xffffff, 1, 200)
	window.camera.add(light)
	light.position.set(50, 0, 10)

	light = new THREE.PointLight(0xffffff, 1, 200)
	window.camera.add(light)
	light.position.set(0, 50, 10)

	light = new THREE.PointLight(0xffffff, 1, 200)
	window.camera.add(light)
	light.position.set(0, 0, 60)

	light = new THREE.AmbientLight(0x111111)
	scene.add(light)

initControls = () ->
	window.addEventListener('DOMMouseScroll', onMouseWheel, false)
	window.addEventListener('mousewheel', onMouseWheel, false)
	window.addEventListener('resize', onWindowResize, false)
	new THREE.OrbitControls( window.camera )

initGlow = () ->
	glowUniforms = 
	{ 
        "c":   { type: "f", value: 0.3 }
        "p":   { type: "f", value: 0.5 }
        glowColor: { type: "c", value: new THREE.Color(0xffff00) }
        viewVector: { type: "v3", value: window.camera.position }
    }

	glowMaterial = new THREE.ShaderMaterial( 
    {
        uniforms: glowUniforms
        vertexShader:   document.getElementById( 'vertexShader'   ).textContent
        fragmentShader: document.getElementById( 'fragmentShader' ).textContent
        side: THREE.FrontSide
        blending: THREE.AdditiveBlending
        transparent: true
    })

	glowMesh = new THREE.Mesh(new THREE.BoxGeometry(1.05, 1.05, 1.05), glowMaterial)
	glowMesh.name = "glow"
	window.scene.add(glowMesh)
	glowMesh

initVoxels = (data) ->
	voxels = []
	for entry in data
		material = new THREE.MeshPhongMaterial({
			color: new THREE.Color("rgb(#{entry.r}, #{entry.v}, #{entry.b})")
		})

		mesh = new THREE.Mesh(new THREE.BoxGeometry(1,1,1), material )
		mesh.position.x = entry.x * (1 + burstFactor)
		mesh.position.y = entry.y * (1 + burstFactor)
		mesh.position.z = entry.z * (1 + burstFactor)
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

render = () ->
	if !window.renderLock
		window.renderLock = true

		drawVoxel voxel for voxel in window.voxels
		onMouseMove(null)
		window.renderer.render(window.scene, window.camera)

		window.renderLock = false
		requestAnimationFrame(render)

makeGlow = (voxelMesh) ->
	window.voxelGlow.position.set(voxelMesh.position.x, voxelMesh.position.y, voxelMesh.position.z)

stopGlow = () ->
	window.voxelGlow.position.set(-500, -500, -500)

drawVoxel = (voxel) ->
	mesh = voxel.mesh
	distance = mesh.position.distanceTo(window.camera.position)
	if distance < 10 
		scene.remove(mesh)
	else
		scene.add(mesh)

onWindowResize = () ->
	window.camera.aspect = (window.innerWidth * 0.7) / window.innerHeight
	window.camera.updateProjectionMatrix()
	window.renderer.setSize( window.innerWidth * 0.7, window.innerHeight )
	render()

getIntersected = (e) ->
	mouse_x = ( e.clientX / window.canvas.width ) * 2 - 1
	mouse_y = - ( e.clientY / window.canvas.height ) * 2 + 1

	window.mouse_vector.set(mouse_x, mouse_y, 0.5)
	window.projector.unprojectVector( window.mouse_vector, window.camera )

	window.ray.set( window.camera.position, window.mouse_vector.sub( window.camera.position ).normalize())
	window.ray.intersectObjects(window.scene.children)

displayData = (mesh) ->
	voxel = window.meshToVoxels[mesh.name]
	document.getElementById("color").style.backgroundColor = "rgb(#{voxel.r}, #{voxel.v}, #{voxel.b})";
	window.aside.innerHTML = metadata.display(axis, voxel.data.x, voxel.data.y, voxel.data.z, voxel.data.r, voxel.data.v, voxel.data.b)

hideData = () ->
	window.aside.innerHTML = "(Aucune donnée)"


window.previousKnownMousePos = {clientX: 0, clientY: 0}
onMouseMove = (e) ->
	if e == null 
		e = window.previousKnownMousePos
	else 
		window.previousKnownMousePos = e

	intersects = getIntersected(e)

	if intersects.length
		makeGlow intersects[0].object
	else
		stopGlow

onMouseClick = (e) ->
	intersects = getIntersected(e)

	if intersects.length
		displayData intersects[1].object
	else
		hideData

onMouseWheel = (e) ->
	window.controls.update()

initRaycasting = () ->
	window.canvas.addEventListener("mousemove", onMouseMove)
	window.canvas.addEventListener("dblclick", onMouseClick)
	new THREE.Raycaster(new THREE.Vector3(0,0,0), new THREE.Vector3(0,0,0))

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

document.getElementById("title").innerHTML = window.metadata.title
document.getElementById("main").innerHTML = window.metadata.title

window.canvas = document.getElementById("canvas")
window.aside = document.getElementById('aside')
window.burstFactor = 0.3
window.meshToVoxels = {}
window.scene = new THREE.Scene()
window.camera = initCamera()
window.voxelGlow = initGlow()
window.controls = initControls()
window.renderer = initRenderer()
window.voxels = initVoxels(parseData(window.data, window.axis))
window.projector = new THREE.Projector()
window.mouse_vector = new THREE.Vector3()
window.ray = initRaycasting()
window.renderLock = false
initLights()
initRaycasting()

render()