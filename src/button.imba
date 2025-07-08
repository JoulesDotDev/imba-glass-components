tag app-button
	prop variant
	prop icon
	prop round

	mouseX = 0
	mouseY = 0

	css button 
		d:flex jc:center ai:center
		c:gray9 @dark: gray1
		bg:white/15 bd:white/20
		backdrop-filter: blur(3px) saturate(140%)
		@media(hover: hover)
			@hover filter:brightness(1.2)
			@hover bxs:lg translate:0 -2px
		filter:none @active:brightness(1.1)
		bxs:sm @active:xs translate:none @active:0 1px
		tween: all 275ms ease of:hidden

		&.icon
			h:12 w:12 rd:full fs:12

		&.regular
			rd:3 fs:6 px:6 py:1.5 h:10
			&:has(.bsicon) pl:3
			.bsicon mr:4 fs:11

		@media(hover: hover)
			&:before
				opacity: 0 @hover:1 rd:inherit
				content:"" pos:abs t:$y l:$x w:80 h:80
				pe:none mix-blend-mode:overlay translate:-50% -50%
				tween:opacity 200ms ease
				bg:radial-gradient(circle at 50% 50%, white/45 0%, transparent 15%)
	
	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	<self>
		if variant === 'icon'
			if !icon 
				throw "Bootstrap Icon prop is missing"
			<div>
				<button.{variant}[$x:{mouseX} $y:{mouseY}] @mousemove=moved>
					<i.bsicon.bi.bi-{icon}>
		
		if variant === 'regular'
			<button.{variant}[$x:{mouseX} $y:{mouseY}] @mousemove=moved>
				if icon 
					<i.bsicon.bi.bi-{icon}>
				<slot>