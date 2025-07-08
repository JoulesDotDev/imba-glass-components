import './button'
import './global.css'
import './theme'

global css body c:warm2 ff:Arial h:100vh

tag App
	count = 0

	css d:flex fld:column g:3 ai:center jc:center h:100vh

	<self>
		<app-button variant="icon" icon="plus">
		<app-button variant="regular"> "Click me"
		<app-button icon="person" variant="regular"> "Action"

imba.mount <App>
