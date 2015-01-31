class Scene
	_voxels = []
	_scene = null
	_glow = null
	_raycaster = null
	_camera = null

	constructor: (data, glow, raycaster, camera) ->
		_glow = glow
		_camera = camera
		_raycaster = raycaster
		_scene = new THREE.Scene()
		light = new THREE.AmbientLight(0x111111)
		_scene.add(light)

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

			_voxels.push(voxel)
			window.meshToVoxels[mesh.name] = voxel

			_scene.add(mesh)
			_scene.add(_camera.getThree())
			_camera.setScene(@)

	prepare: () ->
		drawVoxel voxel for voxel in _voxels

		intersects = _raycaster.getIntersected()
		if intersects.length
			_glow.glowAt(intersects[0].object.position)
		else
			_glow.stopGlow()

		_scene

	add: (mesh) ->
		_scene.add(mesh)

	remove: (mesh) ->
		_scene.remove(mesh)

	drawVoxel = (voxel) ->
		distance = voxel.mesh.position.distanceTo(_camera.position())
		if distance < 10 
			_scene.remove(voxel.mesh)
		else
			_scene.add(voxel.mesh)

	children: () ->
		_scene.children

window.Scene = Scene;