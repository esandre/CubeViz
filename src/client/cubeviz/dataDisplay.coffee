class DataDisplay
	_metadata = null
	_axis = null

	constructor: (metadata, axis) ->
		_metadata = metadata
		_axis = axis

		document.getElementById("title").innerHTML = _metadata.title
		document.getElementById("main").innerHTML = _metadata.title

	display: (voxel) ->
		html = _metadata.display(_axis, voxel.data.x, voxel.data.y, voxel.data.z, voxel.data.r, voxel.data.v, voxel.data.b)
		color = "rgb(#{voxel.r}, #{voxel.v}, #{voxel.b})"
		document.getElementById("color").style.backgroundColor = color
		document.getElementById('aside').innerHTML = html

window.DataDisplay = DataDisplay