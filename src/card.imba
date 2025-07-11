tag app-card
	prop type = "glass"

	# TODO: make the app card container the real card and also inherit from div

	mouseX = 0
	mouseY = 0

	css .card
		backdrop-filter: blur(7px) saturate(145%)
		bg:white/10 c:$page-text
		mih:10 miw:10 h:100% bxs:xl of:hidden rd:inherit
		
		&.solid
			backdrop-filter: none bg:$bg
			c:$page-text-solid bd: 3px solid gray9
		
		&.glass
			tween:backdrop-filter 500ms ease 
			txs: 0px 1px 1px black/90 bd:3px white/15

			@media(hover: hover)
				@hover backdrop-filter: blur(7px) saturate(145%)

			@media(hover: hover)
				&:before
					opacity: 0 @hover:1 rd:inherit
					content:"" pos:abs t:$y l:$x w:200 h:200
					pe:none mix-blend-mode:normal translate:-50% -50%
					tween:opacity 100ms ease
					bg:radial-gradient(circle at 50% 50%, white/30 0%, transparent 50%)
		
	css .title fs:12 p:4 

	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	<self[rd:4]>
		<div.card.{type} [$x:{mouseX} $y:{mouseY}] @mousemove=moved>
			<div.title><slot name="title"> "Card"
			<slot name="content">
		<div.blur>