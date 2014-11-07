class VoxelGlow
	constructor: (camera, @scene) ->
		@suspended = false
		glowUniforms = { 
			"c":   { type: "f", value: 0.3 }
			"p":   { type: "f", value: 0.5 }
			glowColor: { type: "c", value: new THREE.Color(0xffff00) }
			viewVector: { type: "v3", value: camera.position }
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
		@mesh = new THREE.Mesh(glowGeometry, glowMaterial)

	glowAt: (position) ->
		if not @suspended
			@mesh.position.set(position.x, position.y, position.z)
			@scene.add(@mesh)

	stopGlow: () ->
		@scene.remove(@mesh)

	pauseGlow: () ->
		@suspended = true

	resumeGlow: () ->
		@suspended = false

window.VoxelGlow = VoxelGlow