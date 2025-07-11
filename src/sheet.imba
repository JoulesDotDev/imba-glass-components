tag app-sheet < dialog 
	prop color = 'glass'

	mouseX = 0
	mouseY = 0

	def moved e
		let rect = e.currentTarget.getBoundingClientRect!
		mouseX = ((e.clientX - rect.left) / rect.width * 100) + '%'
		mouseY = ((e.clientY - rect.top) / rect.height * 100) + '%'

	css all:unset pos:fixed zi: 100 t:4 b:4 r:4 of:hidden user-select:text
		w:calc(100% - 2.25rem) maw:100 rd:4 d:block txs: 0px 1px 1px black/40
		.container h:100% w:100% p:4
			.header mb:8
		&.glass bg:white/10 bd:3px white/15 c:$page-text
			backdrop-filter: blur(8px) saturate(145%)
			@media(hover: hover)
				.container
					&:before
						opacity: 0 @hover:1 rd:inherit
						content:"" pos:abs t:$y l:$x w:500 h:500
						pe:none mix-blend-mode:normal translate:-50% -50%
						tween:opacity 100ms ease filter: blur(16px)
						bg:radial-gradient(circle at 50% 50%, white/20 0%, transparent 35%)
		.close pos:absolute t:unset @sm:4 b:4 @sm:unset r:4 bg:$close
		&.solid
			bd:3px solid gray9 c:$page-text-solid bg:$bg
		&[open] l:unset o:1
			transform:translateX(0%)
			tween: all 190ms cubic-bezier(0.6, 0, 0.1, 1)
		&:not([open]) o:0.3
			transform:translateX(110%)
			tween: all 180ms cubic-bezier(0.45, 0, 0.2, 1)
		&::backdrop
			bg:white/6 backdrop-filter: blur(3px)

	def render
		<self.{color} [$x:{mouseX} $y:{mouseY}]>
			<div.container @mousemove=moved>
				<global @click.outside.if(self.open)=self.close>
				<app-button$close .close @click=self.close variant="icon" color="solid" icon="x">
				<div.header[fs:lg]>
					<slot name="title">
				<div.content>
					<slot name="content">