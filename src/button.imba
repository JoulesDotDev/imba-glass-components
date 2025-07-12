tag app-button < button
	prop variant = "regular"
	prop icon
	prop round
	prop color = "glass"

	mouseX = 0
	mouseY = 0

	css 
		d:inline-flex jc:center ai:center bd:0 bxs:md
		c:$page-text cursor:pointer of:hidden scale:1 
		$spotlight-color: white/30 $spotlight-size: 25%
		will-change: transform; 
		tween: border 0ms ease
		&[disabled] pe:none o:0.6
		@media(hover: hover)
			tween: all 100ms cubic-bezier(0.4, 0, 0.2, 1)
			@hover bxs:xl @active:md scale:1.1
		scale@active:0.95
		&.icon rd:full h:12 w:12 fs:2rem
			@media(hover: hover)
				@hover scale:1.15
			scale@active: 0.95
			$spotlight-color: white/25 $spotlight-size: 15%
		&.regular rd:3 fs:6 px:6 py:1.5 h:10 
			&:has(.bsicon) pl:3
			.bsicon mr:4 fs:1.5rem
		&.glass bg:white/10 bd:2px white/15 txs: 0px 1px 1px black/40
			backdrop-filter: blur(7px) saturate(145%) brightness(1.3)		
			&[disabled] o:0.7
			@media(hover: hover)
				@hover backdrop-filter: blur(7px) saturate(145%) brightness(1.8)
				&:before
					opacity: 0 @hover:1
					content:"" pos:abs t:$y l:$x w:80 h:80
					pe:none mix-blend-mode:normal translate:-50% -50%
					tween:opacity 100ms ease
					bg:radial-gradient(circle at 50% 50%, $spotlight-color 0%, transparent $spotlight-size)
			backdrop-filter@active: blur(7px) saturate(145%) brightness(1.1)
		&.solid bd: 2px solid gray9
			backdrop-filter:none c:$page-text-solid
		&:focus-visible
			tween: outline 0ms ease
			ol:4px solid white olo:2px filter:brightness(1.3)
	
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
				