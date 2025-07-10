tag app-button < button
	prop variant
	prop icon
	prop round
	prop color = "glass"

	mouseX = 0
	mouseY = 0

	css 
		d:inline-flex jc:center ai:center bd:0 bxs:md
		c:$page-text cursor:pointer of:hidden scale:1 
		$spotlight-color: white/30 $spotlight-size: 25%
		backdrop-filter: blur(7px) saturate(130%) 	
		@media(hover: hover)
			tween: all 300ms cubic-bezier(0.4, 0, 0.2, 1)
			@hover bxs:xl @active:md scale:1.1 
		scale@active:0.95
		&.icon rd:full h:12 w:12 fs:2rem
			@media(hover: hover)
				@hover scale:1.15 
			scale@active: 0.93
			$spotlight-color: white/25 $spotlight-size: 15%
		&.regular rd:3 fs:6 px:6 py:1.5 h:10 
			&:has(.bsicon) pl:3
			.bsicon mr:4 fs:1.5rem
		&.glass bg:white/10 bd:2px white/15 txs: 0px 1px 1px black/40
			@media(hover: hover)
				@hover backdrop-filter: blur(7px) saturate(130%) brightness(1.8)
				&:before
					opacity: 0 @hover:1
					content:"" pos:abs t:$y l:$x w:80 h:80
					pe:none mix-blend-mode:normal translate:-50% -50%
					tween:opacity 300ms ease
					bg:radial-gradient(circle at 50% 50%, $spotlight-color 0%, transparent $spotlight-size)
			backdrop-filter@active: blur(7px) saturate(130%) brightness(1)
		&.solid bd: 2px solid gray9 backdrop-filter:none c:$page-text-solid
	
	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	<self.{variant}.{color} [$x:{mouseX} $y:{mouseY}] @mousemove=moved>
		if variant === 'icon'
			if !icon 
				throw "Bootstrap Icon prop is missing"
			<i.bsicon.bi.bi-{icon}>
		
		if variant === 'regular'
			if icon 
				<i.bsicon.bi.bi-{icon}>
			<slot>
				