return {
	'utilyre/barbecue.nvim',
	name = 'barbecue',
	version = '*',
	event = 'BufReadPost',
	enabled = false,
	dependencies = {
		'SmiteshP/nvim-navic',
		'nvim-tree/nvim-web-devicons', -- optional dependency
	},
	config = true
}
