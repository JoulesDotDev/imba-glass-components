tag app-sheet < div 
	prop color = 'glass'

	mouseX = 0
	mouseY = 0
	gone = false
	open = false

	def setOpen(newData)
		if newData 
			gone = false
			imba.commit!
			setTimeout(&, 0) do
				open = true
			setTimeout(&, 360) do
				$close.focus()		
			document.body.style.overflow = 'hidden'
		else
			document.body.style.overflow = 'auto'
			open = false
			setTimeout(&, 380) do
				gone = true
				imba.commit!

	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	css pos:absolute zi: 100 t:4 b:4 r:4 of:hidden
		w:calc(100% - 2rem) maw:100 rd:4 p:4 d:block
		&.gone d:none
		&.glass bg:white/10 bd:3px white/15 c:$page-text
			backdrop-filter: blur(8px) saturate(130%)
			@media(hover: hover)
				&:before
					opacity: 0 @hover:1 rd:inherit
					content:"" pos:abs t:$y l:$x w:500 h:500
					pe:none mix-blend-mode:normal translate:-50% -50%
					tween:opacity 300ms ease
					bg:radial-gradient(circle at 50% 50%, white/30 0%, transparent 50%)
		&.solid
			bd:3px solid gray9 c:$page-text-solid bg:$bg

		&.open l:unset o:1
			transform:translateX(0%)
			tween: all 380ms cubic-bezier(0.6, 0, 0.1, 1)
			
		&.closed o:0.3
			transform:translateX(110%)
			tween: all 360ms cubic-bezier(0.45, 0, 0.2, 1)

	def render
		setOpen(data)
		<self.{open ? 'open' : 'closed'}.{color}.{gone ? "gone" : ""} [$x:{mouseX} $y:{mouseY}] @mousemove=moved>
			<app-button$close @click=(data = false)
				[pos:absolute t:3 r:3 bg:amber3] variant="icon" color="solid" icon="x">
			<div[fs:lg]>
				<slot name="title">
				<div.content>
					<slot name="content">