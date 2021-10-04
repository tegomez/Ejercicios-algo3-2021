!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'MG 10/4/2021 18:49:16'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that:  (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'MG 10/4/2021 18:48:59'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that:  (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Bienvenido aventurero!!'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MG 10/4/2021 18:46:19'!
carolinaLaCurandera
	 ^CarolinaLaCurandera.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MG 10/4/2021 18:46:29'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MG 10/4/2021 18:46:48'!
tirion
	^#Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MG 10/4/2021 18:45:08'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim. ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/4/2021 18:47:14'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^Riverwood evaluarSiUnJugadorEsPrometedor: unPersonaje.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/4/2021 18:47:41'!
hacerQueLaCuranderaOlvideSusInteracciones
	^ self carolinaLaCurandera olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/4/2021 18:48:01'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	^Riverwood olvidarTodasLasCalificaciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/4/2021 18:48:22'!
hacerQueRiverwoodVeaPrometedorAHamilton
	^Riverwood calificarUnJugadorComoPrometedor: self hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MG 10/4/2021 18:40:19'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MG 10/4/2021 18:40:30'!
tirion
	^#Tirion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MG 10/4/2021 18:40:39'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/4/2021 18:44:42'!
hacerQueElGuardiaOlvideSusInteracciones
	self treborElGuardia olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/4/2021 18:40:56'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	^Riverwood olvidarTodasLasCalificaciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/4/2021 18:41:18'!
hacerQueRiverwoodVeaPrometedorAHamilton
	^Riverwood calificarUnJugadorComoPrometedor: self hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
Riverwood class
	instanceVariableNames: 'jugadoresPrometedores'!

!Riverwood class methodsFor: 'opiniones' stamp: 'MG 10/3/2021 17:06:04'!
calificarUnJugadorComoPrometedor: unPersonajeJugador
	(self evaluarSiUnJugadorEsPrometedor: unPersonajeJugador) ifFalse: [ 
		jugadoresPrometedores add: unPersonajeJugador.
	].
	! !

!Riverwood class methodsFor: 'opiniones' stamp: 'MG 10/3/2021 16:52:30'!
evaluarSiUnJugadorEsPrometedor: unPersonajeJugador
	^ jugadoresPrometedores includes: unPersonajeJugador.! !

!Riverwood class methodsFor: 'opiniones' stamp: 'MG 10/3/2021 16:53:40'!
olvidarJugador: unPersonajeJugador
	TreborElGuardiaDeSkyrim olvidarJugador: unPersonajeJugador.
	CarolinaLaCurandera olvidarJugador: unPersonajeJugador.
	^ self! !

!Riverwood class methodsFor: 'opiniones' stamp: 'MG 10/3/2021 17:09:19'!
olvidarTodasLasCalificaciones
	^ jugadoresPrometedores _ OrderedCollection new.! !


!Riverwood class methodsFor: 'as yet unclassified' stamp: 'MG 10/4/2021 18:49:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	jugadoresPrometedores := ((OrderedCollection new)).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'cantidadDeInteraccionesPorJugador frasesJugadorDesconocido frasesJugadorPrometedor'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MG 10/3/2021 16:32:22'!
interactuarCon: unPersonajeJugador
	self recordarInteraccionCon: unPersonajeJugador.
	(Riverwood evaluarSiUnJugadorEsPrometedor: unPersonajeJugador) ifTrue: [ ^ self responderSegunCantidadDeInteraccionesConJugadorPrometedor: unPersonajeJugador ].
	^ self responderSegunCantidadDeInteraccionesConJugadorDesconocido: unPersonajeJugador.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MG 10/3/2021 16:32:59'!
olvidar
	cantidadDeInteraccionesPorJugador _ Dictionary new.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MG 10/3/2021 16:33:18'!
olvidarJugador: unPersonajeJugador
	^ cantidadDeInteraccionesPorJugador
		at: unPersonajeJugador
		put: 0.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MG 10/3/2021 16:33:25'!
recordarInteraccionCon: unPersonajeJugador
	| cantidadInteracciones |
	cantidadInteracciones _ cantidadDeInteraccionesPorJugador
		at: unPersonajeJugador
		ifAbsent: [ 0 ].
	cantidadDeInteraccionesPorJugador
		at: unPersonajeJugador
		put: cantidadInteracciones + 1.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MG 10/3/2021 16:38:02'!
responderSegunCantidadDeInteraccionesConJugadorDesconocido: unPersonajeJugador
	| cantidadInteracciones |
	cantidadInteracciones _ cantidadDeInteraccionesPorJugador at: unPersonajeJugador.
	^ frasesJugadorDesconocido at: (cantidadInteracciones min: frasesJugadorDesconocido size).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MG 10/3/2021 16:46:58'!
responderSegunCantidadDeInteraccionesConJugadorPrometedor: unPersonajeJugador
	| cantidadInteracciones |
	cantidadInteracciones _ cantidadDeInteraccionesPorJugador at: unPersonajeJugador.
	^ frasesJugadorPrometedor at: (cantidadInteracciones min: frasesJugadorPrometedor size).! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MG 10/4/2021 18:49:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (#Hamilton->4); yourself).
	frasesJugadorDesconocido := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesJugadorPrometedor := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).! !


!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCurandera class
	instanceVariableNames: ''!

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'MG 10/4/2021 18:22:52'!
responderSegunCantidadDeInteraccionesConJugadorDesconocido: unPersonajeJugador
	| cantidadInteracciones | 
	cantidadInteracciones _ cantidadDeInteraccionesPorJugador at: unPersonajeJugador.
	cantidadInteracciones = frasesJugadorDesconocido size ifTrue: [
		Riverwood calificarUnJugadorComoPrometedor: unPersonajeJugador.
		Riverwood olvidarJugador: unPersonajeJugador ].
	^ frasesJugadorDesconocido at: (cantidadInteracciones min: frasesJugadorDesconocido size).! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'MG 10/4/2021 18:49:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (#Hamilton->0); yourself).
	frasesJugadorDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesJugadorPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).! !

Riverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
CarolinaLaCurandera initializeAfterFileIn!