tag app-button
	prop variant
	prop icon
	prop round

	mouseX = 0
	mouseY = 0

	css button 
		d:flex jc:center ai:center
		c:gray9 @dark: gray1
		bg:white/20 bd:white/30
		backdrop-filter: blur(2px) saturate(140%)
		@media(hover: hover)
			@hover filter:brightness(1.2)
			@hover bxs:lg
		filter:none @active:brightness(1.1)
		bxs:sm @active:sm
		tween: all 275ms ease of:hidden

		&.icon
			h:12 w:12 rd:full fs:12
			.bsicon tween: all 275ms ease
			@active .bsicon scale:1.1
			@media(hover: hover)
				@hover .bsicon scale:1.1
				@hover scale:1.06
			scale:1 @active:0.95

		&.regular
			rd:3 fs:6 px:6 py:1.5 h:10
			&:has(.bsicon) pl:3
			.bsicon mr:4 fs:11 tween: all 275ms ease
			@media(hover: hover)
				@hover scale:1.03
				@hover .bsicon scale:1.08
			scale:1 @active:0.96

		@media(hover: hover)
			&:before
				opacity: 0 @hover:1 rd:inherit
				content:"" pos:abs t:$y l:$x w:80 h:80
				pe:none mix-blend:screen translate:-50% -50%
				tween:opacity 200ms ease
				bg:radial-gradient(circle at 50% 50%, white/45 0%, transparent 15%)
		
		&:after
			content:"" pos:abs inset:0 rd:inherit pe:none
			mix-blend-mode:overlay o:1 w:100% h:100% t:0 l:0
			bg: radial-gradient(circle at 20% 30%, purple6/20, transparent 40%), radial-gradient(circle at 60% 20%, teal6/15, transparent 50%), radial-gradient(circle at 80% 70%, yellow6/15, transparent 50%), radial-gradient(circle at 40% 80%, cyan6/15, transparent 50%), radial-gradient(circle at 30% 50%, red6/20, transparent 40%)

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