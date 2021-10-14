!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'JohnLennon PaulMcCartney RingoStarr'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 20:14:43'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| aCustomerBook |

	aCustomerBook := CustomerBook new.
	
	self modificationWith: [ aCustomerBook addCustomerNamed: PaulMcCartney ]  shouldNotTakeMoreThan: 50.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 20:14:51'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| aCustomerBook |

	aCustomerBook := CustomerBook new.
	aCustomerBook addCustomerNamed: PaulMcCartney .
	
	self modificationWith: [aCustomerBook removeCustomerNamed: PaulMcCartney ]  shouldNotTakeMoreThan: 100.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 20:15:05'!
test03CanNotAddACustomerWithEmptyName 

	| aCustomerBook |
			
	aCustomerBook := CustomerBook new.
	
	self canNotDo: [ aCustomerBook addCustomerNamed: '' ] 
		onError: Error 
		checkAssertion: [:anError | 
				self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
				self assert: aCustomerBook isEmpty
			   ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 20:15:13'!
test04CanNotRemoveAnInvalidCustomer
	
	| aCustomerBook  |
			
	aCustomerBook := CustomerBook new.
	aCustomerBook addCustomerNamed: JohnLennon .
	
	self canNotDo: [ aCustomerBook removeCustomerNamed: PaulMcCartney ] 
		onError: NotFound 
		checkAssertion: [:anError | self thereIsOnly: JohnLennon in: aCustomerBook ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 19:11:41'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| aCustomerBook  |

	aCustomerBook := CustomerBook new.
	aCustomerBook addCustomerNamed: PaulMcCartney .
	aCustomerBook suspendCustomerNamed: PaulMcCartney .
	
	self thereAreOnly: 1 suspendedCustomersIn: aCustomerBook.
	self assert: (aCustomerBook includesCustomerNamed: PaulMcCartney ).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 19:11:49'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| aCustomerBook  |
	
	aCustomerBook := CustomerBook new.
	aCustomerBook addCustomerNamed: PaulMcCartney .
	aCustomerBook suspendCustomerNamed: PaulMcCartney .
	aCustomerBook removeCustomerNamed: PaulMcCartney .
	
	self thereAreOnly: 0 suspendedCustomersIn: aCustomerBook.
	self deny: (aCustomerBook includesCustomerNamed: PaulMcCartney ).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 20:15:22'!
test07CanNotSuspendAnInvalidCustomer
	
	| aCustomerBook |
			
	aCustomerBook := CustomerBook new.
	aCustomerBook addCustomerNamed: JohnLennon .
	
	self canNotDo:  [ aCustomerBook suspendCustomerNamed: RingoStarr .] 
		onError: CantSuspend 
		checkAssertion: [:anError | self thereIsOnly: JohnLennon in: aCustomerBook ].



	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MG 10/13/2021 20:15:19'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| aCustomerBook |
			
	aCustomerBook := CustomerBook new.
	aCustomerBook addCustomerNamed: JohnLennon .
	aCustomerBook suspendCustomerNamed: JohnLennon .	
	
	self canNotDo:  [ aCustomerBook suspendCustomerNamed: JohnLennon .] 
		onError: CantSuspend 
		checkAssertion: [:anError | self thereIsOnly: JohnLennon in: aCustomerBook ].

! !


!CustomerBookTest methodsFor: 'toolboxForTesting' stamp: 'MG 10/13/2021 20:14:16'!
canNotDo: anAction onError: typeOfError checkAssertion: anAssertionBlock

	[ anAction value.
	self fail ]
		on: typeOfError
		do: anAssertionBlock.! !

!CustomerBookTest methodsFor: 'toolboxForTesting' stamp: 'MG 10/14/2021 00:36:24'!
modificationWith: anAction shouldNotTakeMoreThan: milliseconds
	
	|millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	anAction value. 
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (milliseconds * millisecond).! !

!CustomerBookTest methodsFor: 'toolboxForTesting' stamp: 'tg 10/14/2021 11:23:57'!
setUp
	JohnLennon := 'John Lennon'. 
	PaulMcCartney := 'Paul McCartney'. 
	RingoStarr := 'Ringo Starr'.! !

!CustomerBookTest methodsFor: 'toolboxForTesting' stamp: 'MG 10/13/2021 19:09:45'!
thereAreOnly: numberOfSuspended suspendedCustomersIn: aCustomerBook
	
	self assert: 0 equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspended equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfSuspended equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'toolboxForTesting' stamp: 'MG 10/13/2021 19:55:51'!
thereIsOnly: aCustomer in: aCustomerBook 

	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aCustomer ).! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'MG 10/13/2021 19:06:38'!
removeCustomerNamed: aName 
 
	(active includes: aName) ifTrue: [
	 	^self removeCustomerNamed: aName in: active.
	].
	 (suspended includes: aName) ifTrue: [
		^self removeCustomerNamed: aName in: suspended .	
	]. 
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'MG 10/13/2021 19:06:56'!
removeCustomerNamed: aName in: aCustomerState
 
	1 to: aCustomerState size do: 
	[ :index | 
		aName = (aCustomerState at: index) 
			ifTrue: [
				aCustomerState removeAt: index.
				^aName.
			] 
	].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
