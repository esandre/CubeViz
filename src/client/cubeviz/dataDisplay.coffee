class DataDisplay
	constructor: (@metadata, @axis) ->
		document.getElementById("title").innerHTML = metadata.title
		document.getElementById("main").innerHTML = metadata.title

	display: (voxel) ->
		html = @metadata.display(@axis, voxel.data.x, voxel.data.y, voxel.data.z, voxel.data.r, voxel.data.v, voxel.data.b)
		color = "rgb(#{voxel.r}, #{voxel.v}, #{voxel.b})"
		document.getElementById("color").style.backgroundColor = color
		document.getElementById('aside').innerHTML = html

window.DataDisplay = DataDisplay