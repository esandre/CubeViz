class VoxelGlow
	_suspended = false
	_camera = null
	_mesh = null
	_suspendTimer = null
	_controls = null

	constructor: (camera, controls) ->
		window.glowInstance = @
		_camera = camera
		_controls = controls
		glowUniforms = { 
			"c":   { type: "f", value: 0.3 }
			"p":   { type: "f", value: 0.5 }
			glowColor: { type: "c", value: new THREE.Color(0xffff00) }
			viewVector: { type: "v3", value: _camera.position }
		}

		glowMaterial = new THREE.ShaderMaterial({
			uniforms: glowUniforms
			vertexShader: document.getElementById('vertexShader').textContent
			fragmentShader: document.getElementById('fragmentShader').textContent
			side: THREE.FrontSide
			blending: THREE.AdditiveBlending
			transparent: true
		})

		glowGeometry = new THREE.BoxGeometry(1.05, 1.05, 1.05)
		_mesh = new THREE.Mesh(glowGeometry, glowMaterial)

		window.addEventListener('DOMMouseScroll', _onMouseWheel, false)
		window.addEventListener('mousedown', window.glowInstance.pauseGlow, false)
		window.addEventListener('mouseup', window.glowInstance.resumeGlow, false)

	glowAt: (position) ->
		if not _suspended
			_mesh.position.set(position.x, position.y, position.z)
			_camera.addToScene(_mesh)

	stopGlow: () ->
		_camera.removeFromScene(_mesh)

	pauseGlow: () ->
		_suspended = true

	resumeGlow: () ->
		_suspended = false
		
	_onMouseWheel = (e) ->
		clearTimeout(_suspendTimer) if _suspendTimer?
		window.glowInstance.pauseGlow()
		window.glowInstance.stopGlow()
		_suspendTimer = setTimeout(window.glowInstance.resumeGlow, 100)
		_controls.update()

window.VoxelGlow = VoxelGlow
window.glowInstance