import './global.css'
import './theme'
import './button'
import './card'
import './sheet'

global css body c:warm2 ff:Arial h:100vh

tag App
	sheetOpen = false
	css .container d:flex fld:column g:3 ai:center jc:center h:100vh	

	<self>
		<div.container route='/card'>
			<app-card[w:100% maw:80]>
				<div slot="title"> "Glass Card"
				<div[p:4] slot="content">
					<div[mt:auto d:flex jc:end]>
						<app-button[bg:white] color="solid" variant="icon" icon="plus"> 
			
			<app-card[w:100% maw:80 bg:amber3] type="solid">
				<div slot="title"> "Solid Card"
				<div[p:4] slot="content">
					<div[mt:auto d:flex jc:end]>
						<app-button[bg:teal3] color="solid" variant="icon" icon="plus"> 

		<div.container route='/'>
			<app-button variant="icon" icon="plus">
			<app-button[bg:white] color="solid" variant="regular"> "Click me"
			<app-button variant="regular"> "Click me"
			<app-button[bg:sky3] color="solid" icon="person" variant="regular"> "Action"
			<app-button icon="person" variant="regular"> "Action"
		<div[p:8] route='/sheet'>
			<app-button @click=(sheetOpen = !sheetOpen) variant="regular"> "Toggle Sheet"
			<app-sheet[$bg:sky3] bind=sheetOpen>
				<%title slot="title"> "Close me"
				<%content slot="content"> "Here is the sheet menu"

imba.mount <App>
