!classDefinition: #TestMarsRover category: 'Ejercicio-MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!TestMarsRover methodsFor: 'test - initialization' stamp: 'MG 11/18/2021 00:24:20'!
test01MarsRoverComienzaEnElPuntoInicialEsperado
	
	self assert: (marsRover position) equals: self initialPosition.! !

!TestMarsRover methodsFor: 'test - initialization' stamp: 'MG 11/18/2021 00:25:10'!
test02MarsRoverComienzaConLaDireccionEsperada
	
	self assert: (marsRover orientation = self initialOrientation).! !


!TestMarsRover methodsFor: 'test - simple instruction' stamp: 'MG 11/18/2021 01:12:35'!
test03MarsRoverRecibeUnaInstruccionDeForwardYSeMueveALaPosicionEsperadaSinCambiarDeDireccion

	| anInstruction finalPosition |

	anInstruction := 'f'.
	finalPosition := (0 @ 1).
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self initialOrientation.! !

!TestMarsRover methodsFor: 'test - simple instruction' stamp: 'MG 11/18/2021 01:12:40'!
test04MarsRoverRecibeUnaInstruccionDeBackwardYSeMueveALaPosicionEsperadaSinCambiarDeDireccion

	| anInstruction finalPosition |
	
	anInstruction := 'b'.
	finalPosition := (0 @ -1).
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self initialOrientation.

	
! !

!TestMarsRover methodsFor: 'test - simple instruction' stamp: 'MG 11/18/2021 01:12:47'!
test07MarsRoverRecibeUnaInstruccionDeRightYCambiaALaDireccionEsperadaSinMoverseDePosicion

	| anInstruction |
	
	anInstruction := 'r'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self east .
! !

!TestMarsRover methodsFor: 'test - simple instruction' stamp: 'MG 11/18/2021 01:12:50'!
test08MarsRoverRecibeUnaInstruccionDeLeftYCambiaALaDireccionEsperadaSinMoverseDePosicion

	| anInstruction |
	
	anInstruction := 'l'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self west.
	
! !


!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:13:00'!
test05MarsRoverRecibeMultiplesInstruccionesDeBackwardYSeMueveALaPosicionEsperada

	| anInstruction finalPosition |
	
	anInstruction := 'b'.
	finalPosition := (0 @ -2).
	
	marsRover execute: anInstruction.
	marsRover execute: anInstruction.
	
	self assert: (marsRover  position) equals: finalPosition.
	
! !

!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:14:33'!
test06MarsRoverRecibeMultiplesInstruccionesDeForwardYSeMueveALaPosicionEsperada

	| anInstruction finalPosition |
	
	anInstruction := 'f'.
	finalPosition := (0 @ 2).
	
	marsRover execute: anInstruction.
	marsRover execute: anInstruction.
	
	self assert: (marsRover  position) equals: finalPosition.
	
! !

!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:13:13'!
test11MarsRoverRecibe2RightsYApuntaHaciaLaDireccionEsperada

	| anInstruction |
	
	anInstruction := 'rr'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self south .! !

!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:13:16'!
test12MarsRoverRecibe3RightsYApuntaHaciaLaDireccionEsperada

	| anInstruction |
	
	anInstruction := 'rrr'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self west .! !

!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:13:19'!
test13MarsRoverRecibe4RightsYVuelveALaDireccionInicial

	| anInstruction |
	
	anInstruction := 'rrrr'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self initialOrientation.! !

!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:13:23'!
test14MarsRoverRecibe2LeftsYApuntaHaciaLaDireccionEsperada

	| anInstruction |
	
	anInstruction := 'll'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self south .! !

!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:13:26'!
test15MarsRoverRecibe3LeftsYApuntaHaciaLaDireccionEsperada

	| anInstruction |
	
	anInstruction := 'lll'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self east .! !

!TestMarsRover methodsFor: 'test - multiple instructions' stamp: 'MG 11/18/2021 01:13:29'!
test16MarsRoverRecibe4LeftsYVuelveALaDireccionInicial

	| anInstruction |
	
	anInstruction := 'llll'.
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self initialOrientation.! !


!TestMarsRover methodsFor: 'test - movements with different orientation' stamp: 'MG 11/18/2021 01:13:34'!
test17MarsRoverApuntaHaciaElEsteYAvanzaCorrectamente
	
	| anInstruction finalPosition |
	
	anInstruction := 'rf'.
	finalPosition:= (1@0).	
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self east.! !

!TestMarsRover methodsFor: 'test - movements with different orientation' stamp: 'MG 11/18/2021 01:13:37'!
test18MarsRoverApuntaHaciaElEsteYRetrocedeCorrectamente
	
	| anInstruction finalPosition |
	
	anInstruction := 'rb'.
	finalPosition:= (-1@0).	
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self east.! !

!TestMarsRover methodsFor: 'test - movements with different orientation' stamp: 'MG 11/18/2021 01:13:39'!
test19MarsRoverApuntaHaciaElSurYAvanzaCorrectamente
	
	| anInstruction finalPosition |
	
	anInstruction := 'rrf'.
	finalPosition:= (0@-1).	
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self south .! !

!TestMarsRover methodsFor: 'test - movements with different orientation' stamp: 'MG 11/18/2021 01:13:48'!
test20MarsRoverApuntaHaciaElSurYRetrocedeCorrectamente
	
	| anInstruction finalPosition |
	
	anInstruction := 'rrb'.
	finalPosition:= (0@1).	
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self south .! !

!TestMarsRover methodsFor: 'test - movements with different orientation' stamp: 'MG 11/18/2021 01:13:45'!
test21MarsRoverApuntaHaciaElOesteYAvanzaCorrectamente
	
	| anInstruction finalPosition |
	
	anInstruction := 'rrrf'.
	finalPosition:= (-1@0).	
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self west .! !

!TestMarsRover methodsFor: 'test - movements with different orientation' stamp: 'MG 11/18/2021 01:13:52'!
test22MarsRoverApuntaHaciaElOesteYRetrocedeCorrectamente
	
	| anInstruction finalPosition |
	
	anInstruction := 'rrrb'.
	finalPosition:= (1@0).	
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self west .! !


!TestMarsRover methodsFor: 'test - intruction format' stamp: 'MG 11/18/2021 01:13:56'!
test09MarsRoverRecibeUnStringConVariasInstruccionesYRealizaElMovimientoEsperado

	| anInstruction finalPosition |
	
	anInstruction := 'ff'.
	finalPosition := (0 @ 2).
	
	marsRover execute: anInstruction.
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self initialOrientation.
	
! !

!TestMarsRover methodsFor: 'test - intruction format' stamp: 'MG 11/18/2021 01:14:10'!
test10MarsRoverRecibeUnStringConUnaInstruccionDesconocidaYEjecutaHastaEncontrarla

	| anInstruction finalPosition |
	
	anInstruction := 'ffx'.
	finalPosition := (0 @ 2).
	
	self
		should: [marsRover execute: anInstruction]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover instructionDontUndertood .
		].
	
	self asegurarQue: marsRover SeEncuentraEn: finalPosition YApuntaHacia: self initialOrientation.
	
	
! !

!TestMarsRover methodsFor: 'test - intruction format' stamp: 'MG 11/18/2021 01:14:13'!
test23MarsRoverRecibeUnStringVacioComoInstruccionYTerminaEnError

	| anInstruction |
	
	anInstruction := ''.
	
	self
		should: [marsRover execute: anInstruction]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover instructionIsEmpty .
		].
	
	self asegurarQue: marsRover SeEncuentraEn: self initialPosition YApuntaHacia: self initialOrientation.
	
	
! !


!TestMarsRover methodsFor: 'variables' stamp: 'MG 11/18/2021 01:11:27'!
east
	^EastOrientation new.! !

!TestMarsRover methodsFor: 'variables' stamp: 'MG 11/18/2021 01:11:49'!
initialOrientation
	^self north.! !

!TestMarsRover methodsFor: 'variables' stamp: 'MG 11/18/2021 00:45:00'!
initialPosition
	^(0 @ 0).! !

!TestMarsRover methodsFor: 'variables' stamp: 'MG 11/18/2021 01:11:32'!
north
	^NorthOrientation new.! !

!TestMarsRover methodsFor: 'variables' stamp: 'MG 11/18/2021 01:11:37'!
south
	^SouthOrientation new.! !

!TestMarsRover methodsFor: 'variables' stamp: 'MG 11/18/2021 01:12:01'!
west
	^WestOrientation new.! !


!TestMarsRover methodsFor: 'toolbox' stamp: 'MG 11/18/2021 00:04:54'!
asegurarQue: aMarsRover SeEncuentraEn: aPosition YApuntaHacia: aOrientation

	self assert: (aMarsRover  position) equals: aPosition.
	self assert: (aMarsRover  orientation = aOrientation).! !


!TestMarsRover methodsFor: 'setup' stamp: 'MG 11/18/2021 01:12:06'!
setUp

	marsRover := MarsRover landingIn: self initialPosition lookingAt: self initialOrientation .! !


!classDefinition: #MarsRover category: 'Ejercicio-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition compassOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRover methodsFor: 'accesing' stamp: 'MG 11/18/2021 12:46:58'!
orientation
	^compassOrientation.! !

!MarsRover methodsFor: 'accesing' stamp: 'MG 11/18/2021 12:46:43'!
position
	^currentPosition. ! !


!MarsRover methodsFor: 'executions' stamp: 'MG 11/18/2021 01:15:22'!
execute: aGroupOfInstructions

	aGroupOfInstructions ifEmpty: [
		^self error: self class instructionIsEmpty.
	].
	aGroupOfInstructions do: [:anSingleInstruction | self executeAnInstruction: anSingleInstruction ].
	
	
		
	! !

!MarsRover methodsFor: 'executions' stamp: 'MG 11/17/2021 23:49:25'!
executeAnInstruction: anInstruction

	(anInstruction = self forwardCommand ) ifTrue: [	^self moveForward.].
	(anInstruction = self backwardCommand ) ifTrue: [^self moveBackward.].
	(anInstruction = self leftCommand ) ifTrue: [^self rotateToLeft.].
	(anInstruction = self rightCommand ) ifTrue: [ ^self rotateToRight.].
	
	self error: self class instructionDontUndertood.
		
		! !


!MarsRover methodsFor: 'initialization - private' stamp: 'MG 11/18/2021 12:46:58'!
initializeWith: anInitialPosition and: anInitialOrientation

	currentPosition := anInitialPosition.
	compassOrientation := anInitialOrientation.! !


!MarsRover methodsFor: 'rotations' stamp: 'MG 11/18/2021 12:46:58'!
rotateToLeft
	^compassOrientation := compassOrientation rotateToLeft.! !

!MarsRover methodsFor: 'rotations' stamp: 'MG 11/18/2021 12:46:58'!
rotateToRight
	^compassOrientation := compassOrientation rotateToRight.! !


!MarsRover methodsFor: 'commands' stamp: 'MG 11/17/2021 23:45:52'!
backwardCommand
	^$b! !

!MarsRover methodsFor: 'commands' stamp: 'MG 11/17/2021 23:45:43'!
forwardCommand
	^$f! !

!MarsRover methodsFor: 'commands' stamp: 'MG 11/17/2021 23:45:59'!
leftCommand
	^$l! !

!MarsRover methodsFor: 'commands' stamp: 'MG 11/17/2021 23:46:04'!
rightCommand
	^$r! !


!MarsRover methodsFor: 'displacements' stamp: 'MG 11/18/2021 12:46:58'!
moveBackward
	^currentPosition :=  currentPosition + compassOrientation backwardDirection.! !

!MarsRover methodsFor: 'displacements' stamp: 'MG 11/18/2021 12:46:58'!
moveForward
	^currentPosition := currentPosition + compassOrientation forwardDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'MG 11/18/2021 00:35:24'!
landingIn: anInitialPosition lookingAt: anInitialOrientation
	^self new initializeWith: anInitialPosition and: anInitialOrientation.! !


!MarsRover class methodsFor: 'error description' stamp: 'MG 11/17/2021 23:48:41'!
instructionDontUndertood
	^'No reconoció la instruccion'! !

!MarsRover class methodsFor: 'error description' stamp: 'MG 11/18/2021 00:19:47'!
instructionIsEmpty
	^'No se puede enviar una instruccion vacía'! !


!classDefinition: #MarsRoverCompass category: 'Ejercicio-MarsRover'!
Object subclass: #MarsRoverCompass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverCompass methodsFor: 'comparing' stamp: 'MG 11/18/2021 00:37:58'!
= otherPotentialOrientation
	^self class = otherPotentialOrientation class.! !


!MarsRoverCompass methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:42'!
rotateToLeft
	self subclassResponsibility.! !

!MarsRoverCompass methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:55'!
rotateToRight
	self subclassResponsibility.! !


!MarsRoverCompass methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:00'!
backwardDirection
	self subclassResponsibility.! !

!MarsRoverCompass methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:12'!
forwardDirection
	self subclassResponsibility.! !


!classDefinition: #EastOrientation category: 'Ejercicio-MarsRover'!
MarsRoverCompass subclass: #EastOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!EastOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:42'!
rotateToLeft
	^NorthOrientation new.! !

!EastOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:55'!
rotateToRight
	^SouthOrientation new.! !


!EastOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:00'!
backwardDirection
	^(-1 @ 0).! !

!EastOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:12'!
forwardDirection
	^(1 @ 0)! !


!classDefinition: #NorthOrientation category: 'Ejercicio-MarsRover'!
MarsRoverCompass subclass: #NorthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!NorthOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:42'!
rotateToLeft
	^WestOrientation new.! !

!NorthOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:55'!
rotateToRight
	^EastOrientation new.! !


!NorthOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:00'!
backwardDirection
	^(0 @ -1).! !

!NorthOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:12'!
forwardDirection
	^(0 @ 1)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthOrientation class' category: 'Ejercicio-MarsRover'!
NorthOrientation class
	instanceVariableNames: ''!

!NorthOrientation class methodsFor: 'as yet unclassified' stamp: 'MG 11/17/2021 01:28:35'!
pertenece: unPuntoCardinal
	^unPuntoCardinal  = 'N'.! !


!classDefinition: #SouthOrientation category: 'Ejercicio-MarsRover'!
MarsRoverCompass subclass: #SouthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!SouthOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:42'!
rotateToLeft
	^EastOrientation new.! !

!SouthOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:55'!
rotateToRight
	^WestOrientation new.! !


!SouthOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:00'!
backwardDirection
	^(0 @ 1).! !

!SouthOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:12'!
forwardDirection
	^(0 @ -1)! !


!classDefinition: #WestOrientation category: 'Ejercicio-MarsRover'!
MarsRoverCompass subclass: #WestOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!WestOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:42'!
rotateToLeft
	^SouthOrientation new.! !

!WestOrientation methodsFor: 'rotations' stamp: 'MG 11/18/2021 01:18:55'!
rotateToRight
	^NorthOrientation new.
! !


!WestOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:00'!
backwardDirection
	^(1 @ 0).! !

!WestOrientation methodsFor: 'displacements' stamp: 'MG 11/18/2021 01:23:12'!
forwardDirection
	^(-1 @ 0)! !
