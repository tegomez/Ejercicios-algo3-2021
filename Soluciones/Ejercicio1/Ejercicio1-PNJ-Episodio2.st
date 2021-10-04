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

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje'!
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje'!
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje'!
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje'!
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje'!
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores'!
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores'!
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones'!
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'tg 10/4/2021 14:30:34'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'tg 10/4/2021 14:30:25'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Bienvenido aventurero!!'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'tg 10/4/2021 14:28:55'!
carolinaLaCurandera
	^CarolinaLaCurandera.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'tg 10/4/2021 14:28:25'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'tg 10/4/2021 14:28:02'!
tirion
	^#Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes'!
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'tg 10/4/2021 14:27:37'!
esVistoPorElPuebloComoPrometedor: unPersonajeJugador
	^ Riverwood evaluarSiUnJugadorEsPrometedor: unPersonajeJugador.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'tg 10/4/2021 14:26:58'!
hacerQueLaCuranderaOlvideSusInteracciones
	^CarolinaLaCurandera olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'tg 10/4/2021 14:26:04'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	^Riverwood olvidarTodasLasCalificaciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/3/2021 16:30:07'!
hacerQueRiverwoodVeaPrometedorAHamilton
	^ Riverwood calificarUnJugadorComoPrometedor: self hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones'!
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

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje'!
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje'!
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje'!
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje'!
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje'!
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje'!
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje'!
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores'!
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores'!
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MG 10/3/2021 17:04:38'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MG 10/3/2021 17:04:49'!
tirion
	^ #Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes'!
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones'!
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/3/2021 16:56:38'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	^ Riverwood olvidarTodasLasCalificaciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MG 10/3/2021 17:04:08'!
hacerQueRiverwoodVeaPrometedorAHamilton
	^ Riverwood calificarUnJugadorComoPrometedor: self hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones'!
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


!Riverwood class methodsFor: 'as yet unclassified' stamp: 'tg 10/4/2021 14:34:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	jugadoresPrometedores := ((OrderedCollection new) add: #Hamilton; yourself).! !


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


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'tg 10/4/2021 14:34:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (#Hamilton->2); yourself).
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

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'MG 10/3/2021 16:49:38'!
responderSegunCantidadDeInteraccionesConJugadorDesconocido: unPersonajeJugador
	| cantidadInteracciones |
	cantidadInteracciones _ cantidadDeInteraccionesPorJugador at: unPersonajeJugador.
	cantidadInteracciones = frasesJugadorDesconocido size ifTrue: [
		Riverwood calificarUnJugadorComoPrometedor: unPersonajeJugador.
		Riverwood olvidarJugador: unPersonajeJugador ].
	^ frasesJugadorDesconocido at: (cantidadInteracciones min: frasesJugadorDesconocido size).! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'tg 10/4/2021 14:34:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (#Hamilton->1); yourself).
	frasesJugadorDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesJugadorPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).! !

Riverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
CarolinaLaCurandera initializeAfterFileIn!