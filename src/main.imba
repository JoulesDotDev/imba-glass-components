import './global.css'
import './theme'
import './button'
import './card'
import './sheet'

global css body c:warm2 ff:Arial h:100vh

tag App
	css .container d:flex fld:column g:3 ai:center jc:center h:100vh	

	<self>
		<div.container route='/card'>
			<app-card[w:100% maw:80]>
				<div slot="title"> "Glass Card"
				<div[p:4] slot="content">
					<div[mt:auto d:flex jc:end]>
						<app-button[bg:white] color="solid" variant="icon" icon="plus"> 
			
			<app-card[w:100% maw:80 bg:amber3] color="solid">
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
			<app-button @click=($sheet.showModal()) variant="regular"> "Toggle Sheet"
			<app-sheet$sheet [$bg:sky3 $close:amber3]>
				<span slot="title"> "Close me"
				<div slot="content"> 
					<div[mb:8]> "Here is the sheet menu"
					<app-card[w:100% mb:6] inglass>
						<div[p:4] slot="content">
							<div[mb:6]> "We're very nested"
							<app-card[w:100% bg:green3] color="solid">
								<div[p:4] slot="content"> "Severely nested"
					<app-card[w:100% bg:sky3] color="solid">
						<div[p:4] slot="content"> 
							<div[mb:7]> "We have actions too"
							<div[d:flex jc:center]>
								<app-button[bg:purple3] @click=$sheet.close color="solid" icon="cursor" variant="regular"> "Close Sheet"

imba.mount <App>
