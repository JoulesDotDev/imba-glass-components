tag app-card < div
	prop color = "glass"
	prop inglass = false

	# TODO: make the app card container the real card and also inherit from div

	mouseX = 0
	mouseY = 0

	css backdrop-filter: blur(7px) saturate(145%)
		bg:white/10 c:$page-text rd:4
		mih:10 miw:10 bxs:xl of:hidden
		
		&.solid
			backdrop-filter: none bg:$bg txs:none
			c:$page-text-solid bd: 3px solid gray9
		
		&.glass
			tween:backdrop-filter 500ms ease 
			txs: 0px 1px 1px black/90 bd:3px white/15

			@media(hover: hover)
				@hover backdrop-filter: blur(7px) saturate(145%)

			&:not(.inglass)
				@media(hover: hover)
					&:before
						opacity: 0 @hover:1 rd:inherit
						content:"" pos:abs t:$y l:$x w:200 h:200
						pe:none mix-blend-mode:normal translate:-50% -50%
						tween:opacity 100ms ease
						bg:radial-gradient(circle at 50% 50%, white/30 0%, transparent 50%)
		
		.title fs:12 p:4 pb:0

	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	<self.card.{color}.{inglass ? 'inglass' : ''} [$x:{mouseX} $y:{mouseY}] @mousemove=moved>
		<div.title><slot name="title"> "Card"
		<slot name="content">