tag app-button
	prop variant
	prop icon
	prop round
	prop type = "glass"

	mouseX = 0
	mouseY = 0

	css
		&.icon rd:full
		&.regular rd:3

	css button 
		d:flex jc:center ai:center
		c:$page-text cursor:pointer
		@media(hover: hover)
			@hover bxs:lg
			tween: all 200ms ease of:hidden
		backdrop-filter: blur(7px) saturate(130%) @active: blur(7px) saturate(130%) brightness(1)
		bg:white/10 bd:1px white/20
		bxs:sm @active:sm scale:1
		
		&.glass
			txs: 0px 1px 1px black/40
			@media(hover: hover)
				@hover backdrop-filter: blur(7px) saturate(130%) brightness(1.1)
			@media(hover: hover)
				&:before
					opacity: 0 @hover:1 rd:inherit
					content:"" pos:abs t:$y l:$x w:80 h:80
					pe:none mix-blend-mode:normal translate:-50% -50%
					tween:opacity 300ms ease
					bg:radial-gradient(circle at 50% 50%, white/30 0%, transparent 20%)

		&.solid
			backdrop-filter:none
			bg:inherit c:$page-text-solid

		&.icon
			h:12 w:12 rd:inherit fs:2rem
			@media(hover: hover)
				@hover scale:1.2 @active:1

		&.regular
			rd:inherit fs:6 px:6 py:1.5 h:10
			&:has(.bsicon) pl:3
			.bsicon mr:4 fs:1.5rem
			@media(hover: hover)
				@hover scale:1.1 @active:1
	
	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	<self.{variant}>
		if variant === 'icon'
			if !icon 
				throw "Bootstrap Icon prop is missing"
			<button.{variant}.{type} [$x:{mouseX} $y:{mouseY}] @mousemove=moved>
				<i.bsicon.bi.bi-{icon}>
		
		if variant === 'regular'
			<button.{variant}.{type} [$x:{mouseX} $y:{mouseY}] @mousemove=moved>
				if icon 
					<i.bsicon.bi.bi-{icon}>
				<slot>