class DataParser
	constructor: () ->

	parse: (data, axis) ->
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

		return output

window.DataParser = DataParser