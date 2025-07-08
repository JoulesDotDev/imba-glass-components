tag app-button
	prop variant
	prop icon
	prop round

	mouseX = 0
	mouseY = 0

	css button 
		d:flex jc:center ai:center
		c:$page-text
		@media(hover: hover)
			@hover backdrop-filter: blur(5px) saturate(200%) brightness(1.3)
			@hover bxs:lg
			tween: all 300ms ease of:hidden
		backdrop-filter: blur(5px) saturate(200%) @active: blur(5px) saturate(170%) brightness(1)
		bg:white/10 bd:white/20
		bxs:sm @active:xs scale:1

		&.icon
			h:12 w:12 rd:full fs:12
			@media(hover: hover)
				@hover scale:1.2 @active:1

		&.regular
			rd:3 fs:6 px:6 py:1.5 h:10
			&:has(.bsicon) pl:3
			.bsicon mr:4 fs:10
			@media(hover: hover)
				@hover scale:1.1 @active:1

		@media(hover: hover)
			&:before
				opacity: 0 @hover:1 rd:inherit
				content:"" pos:abs t:$y l:$x w:80 h:80
				pe:none mix-blend-mode:normal translate:-50% -50%
				tween:opacity 200ms ease
				bg:radial-gradient(circle at 50% 50%, white/20 0%, transparent 35%)
	
	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	<self>
		if variant === 'icon'
			if !icon 
				throw "Bootstrap Icon prop is missing"
			<button.{variant}[$x:{mouseX} $y:{mouseY}] @mousemove=moved>
				<i.bsicon.bi.bi-{icon}>
		
		if variant === 'regular'
			<button.{variant}[$x:{mouseX} $y:{mouseY}] @mousemove=moved>
				if icon 
					<i.bsicon.bi.bi-{icon}>
				<slot>