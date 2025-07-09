tag app-card
	prop type = "glass"

	mouseX = 0
	mouseY = 0

	css .card
		backdrop-filter: blur(7px) saturate(130%)
		bg:white/10 c:$page-text
		mih:10 miw:10 h:100% bxs:xl of:hidden rd:inherit
		
		&.solid
			backdrop-filter: none bg:inherit
			c:$page-text-solid
		
		&.glass
			tween:backdrop-filter 500ms ease 
			txs: 0px 1px 1px black/90 bd:2px white/20

			@media(hover: hover)
				@hover backdrop-filter: blur(7px) saturate(130%)

			@media(hover: hover)
				&:before
					opacity: 0 @hover:1 rd:inherit
					content:"" pos:abs t:$y l:$x w:200 h:200
					pe:none mix-blend-mode:normal translate:-50% -50%
					tween:opacity 300ms ease
					bg:radial-gradient(circle at 50% 50%, white/25 0%, transparent 30%)
		
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