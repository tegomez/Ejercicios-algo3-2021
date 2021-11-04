!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinder stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'tg 11/3/2021 19:55:26'!
setUp
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'tg 11/3/2021 21:16:10'!
test01APrefixHasASentenceToFind
	|sentenceFinded orderedCollectionAuxiliar |
	
	orderedCollectionAuxiliar := OrderedCollection new.
	
	stack push: 'Winter is comming'.
	orderedCollectionAuxiliar add: 'Winter is comming'.
	
	sentenceFinded := sentenceFinder find: 'Wint' in: stack.
	
	self assert: sentenceFinded = orderedCollectionAuxiliar.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 00:50:38'!
test02APrefixDoesNotHaveASentenceToFind
	
	stack  push: 'Winter is comming'.	
	
	self
		should: [sentenceFinder find: 'abc' in: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix NotFoundMessage 
		].
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 01:48:14'!
test03APrefixCanNotBeEmpty
	
	stack push: 'Winter is comming'.
	
	self 
		should: [sentenceFinder find: '' in: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = PrefixIsEmptyError PrefixShouldNotBeEmptyMessage 
		].
	
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 00:50:59'!
test04ASentenceToFindIsCaseSensitive
	
	stack push: 'Winter is comming'.
		
	self
		should: [sentenceFinder find: 'wint' in: stack]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix NotFoundMessage 
		].
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 01:47:15'!
test05CanNotFindASentenceWithEmptyStack
		
	self
		should: [sentenceFinder find: 'wint' in: stack]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = StackIsEmptyError StackIsEmptyMessage 
		].
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 01:47:02'!
test06APrefixShouldNotContainSpaces
	
	stack push: 'Winter is comming'.	
	
	self
		should: [sentenceFinder find: 'Wint er' in: stack]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = PrefixWithSpaceError PrefixShouldNotContainASpaceMessage 
		].
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 17:06:43'!
test07OriginalStackShouldNotBeModifiedWhenASentenceIsFounded
	|originalStack |
	
	stack  push: 'Winter is comming'.
	stack  push: 'Winning is everything'.
	stack  push: 'The wind of Winter'.
	stack  push: 'Winter is here'.

	originalStack := OOStack new.
	originalStack  push: 'Winter is comming'.
	originalStack  push: 'Winning is everything'.
	originalStack  push: 'The wind of Winter'.
	originalStack  push: 'Winter is here'.
	
	sentenceFinder find: 'Wint' in: stack.
	
	self assert: stack size equals: originalStack size.
	
	((stack isEmpty not) and: (originalStack isEmpty not)) ifTrue:[ 
		|CurrentElement OriginalElement|
		CurrentElement := stack top.
		OriginalElement:= originalStack top.
		self assert: CurrentElement equals: OriginalElement.
		stack pop.
		originalStack pop.
	].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 01:00:09'!
test08DoNotReturnTheFirstSentenceThatMatchWithPrefix
	|findedSentenceCollection|
	
	stack  push: 'Winter is comming'.
	stack  push: 'Winter is Here'.
	
	findedSentenceCollection := sentenceFinder find: 'Wint' in: stack. 
	
	self assert: findedSentenceCollection class equals: OrderedCollection.
	self assert: (findedSentenceCollection at: 1) equals: 'Winter is Here'.
	self assert: (findedSentenceCollection at: 2) equals: 'Winter is comming'.
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MG 11/4/2021 00:51:32'!
test09APrefixIsPartOfASentenceButNotTheBeginning
	
	stack push: 'Winter is comming'.

	self
		should: [sentenceFinder find: 'ter' in: stack]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix NotFoundMessage 
		].
	
	

! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'MG 11/4/2021 00:35:01'!
isEmpty
	^stackCollection isEmpty.! !


!OOStack methodsFor: 'signal errors' stamp: 'tg 10/31/2021 18:11:12'!
stackEmptyErrorDescription
	^self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'initialization' stamp: 'MG 11/4/2021 00:36:53'!
initialize
	 stackCollection := OrderedCollection new.! !


!OOStack methodsFor: 'operations' stamp: 'MG 11/4/2021 18:21:36'!
pop
	|stateCollectionSelected|	
	stateCollectionSelected := StackCollectionState subclasses detect: [: aSubClassState |  aSubClassState isSatisfiedBy: self].
	^stateCollectionSelected new removeLastElementOf: self.! !

!OOStack methodsFor: 'operations' stamp: 'MG 11/4/2021 17:18:11'!
push: anObjectToPush 
	^self content add: anObjectToPush! !

!OOStack methodsFor: 'operations' stamp: 'MG 11/2/2021 19:39:34'!
size
	^self content size.! !

!OOStack methodsFor: 'operations' stamp: 'MG 11/4/2021 18:22:19'!
top
	|stateCollectionSelected|	
	stateCollectionSelected := StackCollectionState subclasses detect: [: aSubclassState |  aSubclassState isSatisfiedBy: self].
	^stateCollectionSelected new getLastElementOf: self.! !


!OOStack methodsFor: 'accesing - private' stamp: 'MG 11/4/2021 00:35:01'!
content
	^stackCollection.! !


!OOStack methodsFor: 'operations - private' stamp: 'MG 11/4/2021 00:36:22'!
last
	^self content last.! !

!OOStack methodsFor: 'operations - private' stamp: 'MG 11/4/2021 00:36:25'!
removeLast
	^self content removeLast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'MG 11/4/2021 18:26:13'!
find: aPrefixString in: aStack

	|anAuxiliarStack collectionWithFindedElements |
	
	anAuxiliarStack := OOStack new.
	collectionWithFindedElements := OrderedCollection new.
	
	SentenceFinderParametersErrors subclasses 
		do: [: errorSubClass |  
			(errorSubClass verifiedAnErrorWithParameters: aPrefixString and: aStack) 
			ifTrue: [^errorSubClass new signalError]
		].
		
	self copy: aStack 
		in: anAuxiliarStack 
		doingWithEachElement: [:currentElement | 
			(currentElement beginsWith: aPrefixString) 
			ifTrue: [collectionWithFindedElements add: currentElement]
		].
	
	self copy: anAuxiliarStack 
		in: aStack 
		doingWithEachElement: [:aux | "No hace nada"].
		
	(collectionWithFindedElements isEmpty) ifTrue: [^self signalNotFound ].
	^collectionWithFindedElements. 
! !


!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'MG 11/4/2021 17:24:35'!
copy: aStack in: anAuxiliarStack doingWithEachElement: aAction
	
	[aStack isEmpty not] whileTrue: [ | anAuxiliarElement |
		anAuxiliarElement := aStack top.
		anAuxiliarStack push: anAuxiliarElement.
		aAction value: anAuxiliarElement.
		aStack pop.
 	].
	! !


!SentenceFinderByPrefix methodsFor: 'signal errors' stamp: 'MG 11/4/2021 00:47:16'!
signalNotFound
	self error: self class NotFoundMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'signal error messages' stamp: 'MG 11/4/2021 00:48:41'!
NotFoundMessage
	^'Not found an element with this prefix'.! !


!classDefinition: #SentenceFinderParametersErrors category: 'Stack-Exercise'!
Object subclass: #SentenceFinderParametersErrors
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderParametersErrors methodsFor: 'signal error' stamp: 'MG 11/4/2021 01:10:17'!
signalError
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderParametersErrors class' category: 'Stack-Exercise'!
SentenceFinderParametersErrors class
	instanceVariableNames: ''!

!SentenceFinderParametersErrors class methodsFor: 'error case' stamp: 'MG 11/4/2021 18:26:12'!
verifiedAnErrorWithParameters: aPrefixString and: aStack
	self subclassResponsibility.! !


!classDefinition: #PrefixIsEmptyError category: 'Stack-Exercise'!
SentenceFinderParametersErrors subclass: #PrefixIsEmptyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixIsEmptyError methodsFor: 'signal error' stamp: 'MG 11/4/2021 01:42:32'!
signalError
	self error: self class PrefixShouldNotBeEmptyMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixIsEmptyError class' category: 'Stack-Exercise'!
PrefixIsEmptyError class
	instanceVariableNames: ''!

!PrefixIsEmptyError class methodsFor: 'error case' stamp: 'MG 11/4/2021 18:26:13'!
verifiedAnErrorWithParameters: aPrefixString and: aStack
	^aPrefixString isEmpty! !


!PrefixIsEmptyError class methodsFor: 'signal error message' stamp: 'MG 11/4/2021 01:37:01'!
PrefixShouldNotBeEmptyMessage
	^'Prefix shoul not be empty'! !


!classDefinition: #PrefixWithSpaceError category: 'Stack-Exercise'!
SentenceFinderParametersErrors subclass: #PrefixWithSpaceError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixWithSpaceError methodsFor: 'signal error' stamp: 'MG 11/4/2021 01:42:55'!
signalError
	self error: self class PrefixShouldNotContainASpaceMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixWithSpaceError class' category: 'Stack-Exercise'!
PrefixWithSpaceError class
	instanceVariableNames: ''!

!PrefixWithSpaceError class methodsFor: 'signal error message' stamp: 'MG 11/4/2021 01:37:28'!
PrefixShouldNotContainASpaceMessage
	^'Prefix shoul not contain a space'.! !


!PrefixWithSpaceError class methodsFor: 'error case' stamp: 'MG 11/4/2021 18:26:12'!
verifiedAnErrorWithParameters: aPrefixString and: aStack
	^aPrefixString includesSubString: ' '.! !


!classDefinition: #StackIsEmptyError category: 'Stack-Exercise'!
SentenceFinderParametersErrors subclass: #StackIsEmptyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackIsEmptyError methodsFor: 'signal error' stamp: 'MG 11/4/2021 01:43:07'!
signalError
	self error: self class StackIsEmptyMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackIsEmptyError class' category: 'Stack-Exercise'!
StackIsEmptyError class
	instanceVariableNames: ''!

!StackIsEmptyError class methodsFor: 'error case' stamp: 'MG 11/4/2021 18:26:12'!
verifiedAnErrorWithParameters: aPrefixString and: aStack
	^aStack isEmpty.! !


!StackIsEmptyError class methodsFor: 'signal error message' stamp: 'MG 11/4/2021 01:37:49'!
StackIsEmptyMessage
	^'The stack is empty to find a sentence'! !


!classDefinition: #StackCollectionState category: 'Stack-Exercise'!
Object subclass: #StackCollectionState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackCollectionState methodsFor: 'operations' stamp: 'MG 11/4/2021 00:20:45'!
getLastElementOf: aStack
	self subclassResponsibility.! !

!StackCollectionState methodsFor: 'operations' stamp: 'MG 11/4/2021 00:21:20'!
removeLastElementOf: aStack
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackCollectionState class' category: 'Stack-Exercise'!
StackCollectionState class
	instanceVariableNames: ''!

!StackCollectionState class methodsFor: 'as yet unclassified' stamp: 'MG 11/4/2021 18:15:29'!
isSatisfiedBy: aStack
	self subclassResponsibility.! !


!classDefinition: #StackEmptyCollection category: 'Stack-Exercise'!
StackCollectionState subclass: #StackEmptyCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackEmptyCollection methodsFor: 'operations' stamp: 'MG 11/4/2021 00:20:45'!
getLastElementOf: aStack
	^aStack 	stackEmptyErrorDescription.! !

!StackEmptyCollection methodsFor: 'operations' stamp: 'MG 11/4/2021 00:21:20'!
removeLastElementOf: aStack
	^aStack 	stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackEmptyCollection class' category: 'Stack-Exercise'!
StackEmptyCollection class
	instanceVariableNames: ''!

!StackEmptyCollection class methodsFor: 'as yet unclassified' stamp: 'MG 11/4/2021 18:15:29'!
isSatisfiedBy: aStack
	^aStack isEmpty.! !


!classDefinition: #StackNotEmptyCollection category: 'Stack-Exercise'!
StackCollectionState subclass: #StackNotEmptyCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNotEmptyCollection methodsFor: 'operations' stamp: 'MG 11/4/2021 00:20:45'!
getLastElementOf: aStack
	^aStack last.! !

!StackNotEmptyCollection methodsFor: 'operations' stamp: 'MG 11/4/2021 00:21:20'!
removeLastElementOf: aStack
	^aStack removeLast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackNotEmptyCollection class' category: 'Stack-Exercise'!
StackNotEmptyCollection class
	instanceVariableNames: ''!

!StackNotEmptyCollection class methodsFor: 'as yet unclassified' stamp: 'MG 11/4/2021 18:15:29'!
isSatisfiedBy: aStack
	^(aStack isEmpty) not.! !
