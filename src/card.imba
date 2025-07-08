tag app-card
	mouseX = 0
	mouseY = 0

	css .card
		backdrop-filter: blur(5px) saturate(200%) brightness(1)
		bg:white/10 bd:white/20 c:$page-text
		mih:10 miw:10 rd:4 h:100% bxs:lg of:hidden
		tween:backdrop-filter 500ms ease
		@media(hover: hover)
			@hover backdrop-filter: blur(5px) saturate(170%) brightness(1.15)

		@media(hover: hover)
			&:before
				opacity: 0 @hover:1 rd:inherit
				content:"" pos:abs t:$y l:$x w:200 h:200
				pe:none mix-blend-mode:normal translate:-50% -50%
				tween:opacity 200ms ease
				bg:radial-gradient(circle at 50% 50%, white/10 0%, transparent 40%)
		
	css .title fs:12 p:4 

	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	<self>
		<div.card [$x:{mouseX} $y:{mouseY}] @mousemove=moved>
			<div.title><slot name="title"> "Card"
			<slot name="content">