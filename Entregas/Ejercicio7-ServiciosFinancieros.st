!classDefinition: #BriefcaseAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #BriefcaseAccountTest
	instanceVariableNames: 'mainBriefcase receptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BriefcaseAccountTest methodsFor: 'set up' stamp: 'MG 11/28/2021 19:26:23'!
setUp

	mainBriefcase := BriefcaseAccount new.
	receptiveAccount := ReceptiveAccount new.! !


!BriefcaseAccountTest methodsFor: 'test - initialization' stamp: 'MG 11/27/2021 19:18:48'!
test01UnPortfolioSinCuentasTienenBalance0
	
	self assert: 0*peso equals: mainBriefcase balance.! !


!BriefcaseAccountTest methodsFor: 'test - balance' stamp: 'MG 11/27/2021 19:26:26'!
test02UnPortfolioConUnaCuentaConTransaccionesPoseeElBalanceCorrecto
	
	mainBriefcase addAccount: (self anAccountWith: Deposit for: 50*peso).
	 
	self assert: 50*peso equals: mainBriefcase balance.! !

!BriefcaseAccountTest methodsFor: 'test - balance' stamp: 'MG 11/27/2021 19:27:05'!
test03UnPortfolioConMasDeUnaCuentaConTransaccionesPoseeElBalanceCorrecto
	
	| aFirstAccount aSecondAccount |
	
	aFirstAccount := (self anAccountWith: Deposit for: 50*peso).
	aSecondAccount := (self anAccountWith: Deposit for: 50*peso).
	
	mainBriefcase addAccount: aFirstAccount.
	mainBriefcase addAccount: aSecondAccount.
		 
	self assert:  100*peso equals: mainBriefcase balance.! !


!BriefcaseAccountTest methodsFor: 'test - get transactions' stamp: 'MG 11/28/2021 19:28:42'!
test06UnPortFolioConUnaCuentaSinTransaccionesLasObtiene
	
	| anAccountTransactions |
	
	mainBriefcase addAccount: receptiveAccount.
	
	anAccountTransactions := mainBriefcase getTransactionsOf: receptiveAccount.
	
	self assert: anAccountTransactions isEmpty.! !

!BriefcaseAccountTest methodsFor: 'test - get transactions' stamp: 'MG 11/28/2021 19:29:07'!
test07UnPortFolioConUnaCuentaConTransaccionesLasObtiene
	
	| aAccountTransactions aTransaction |
	
	mainBriefcase addAccount: receptiveAccount.
	
	aTransaction := Deposit register: 50*peso on: receptiveAccount.
	
	aAccountTransactions := mainBriefcase getTransactionsOf: receptiveAccount.
	
	self assert: (aAccountTransactions includes: aTransaction ).! !

!BriefcaseAccountTest methodsFor: 'test - get transactions' stamp: 'MG 11/28/2021 19:28:16'!
test11UnPortfolioObtieneLasTransaccionesDeUnPortfolioIncluidoYConTransacciones
	
	| aBriefcase theTransactionOnABriefcase aAccountTransactions  |

	theTransactionOnABriefcase := Withdraw register: 50*  peso  on: 	receptiveAccount.
	
	aBriefcase := BriefcaseAccount new.
	aBriefcase addAccount: receptiveAccount.
	
	mainBriefcase addAccount: aBriefcase.
	
	aAccountTransactions := mainBriefcase getTransactionsOf: aBriefcase.
	
	self assert: aAccountTransactions includes: theTransactionOnABriefcase. ! !

!BriefcaseAccountTest methodsFor: 'test - get transactions' stamp: 'MG 11/28/2021 19:26:23'!
test12UnPortfolioObtieneLasTransaccionesDeUnPortfolioIncluidoYSinTransacciones
	
	| aBriefcase aAccountTransactions  |
	
	aBriefcase := BriefcaseAccount new.
	aBriefcase addAccount: receptiveAccount.
	
	mainBriefcase addAccount: aBriefcase.
	
	aAccountTransactions := mainBriefcase getTransactionsOf: aBriefcase.
	
	self assert:  aAccountTransactions isEmpty. ! !


!BriefcaseAccountTest methodsFor: 'test - has transactions' stamp: 'MG 11/28/2021 18:20:45'!
test04UnPortFolioConUnaCuentaSinTransaccionesNoRegistraNinguna

	| aDeposit aWithdraw |
	aDeposit :=  Deposit for: 100 * peso.
	aWithdraw := Withdraw for: 50 * peso.
		
	self deny: (mainBriefcase hasRegistered: aDeposit).
	self deny: (mainBriefcase hasRegistered: aWithdraw).! !

!BriefcaseAccountTest methodsFor: 'test - has transactions' stamp: 'MG 11/28/2021 19:26:50'!
test05UnPortFolioConUnaCuentaConTransaccionesLasRegistra

	| aDeposit aWithdraw  |
	
	aDeposit :=  Deposit register:  100 * peso on:  receptiveAccount.
	aWithdraw := Withdraw register:  50 * peso on:  receptiveAccount.
	
	mainBriefcase addAccount: receptiveAccount.
	 
	self assert: (mainBriefcase hasRegistered: aDeposit).
	self assert: (mainBriefcase hasRegistered: aWithdraw).
	! !

!BriefcaseAccountTest methodsFor: 'test - has transactions' stamp: 'MG 11/28/2021 19:27:06'!
test10UnPortFolioConUnPortFolioConTransaccionesLasRegistra
	
	| aDeposit aWithdraw aBriefcase |
	
	aBriefcase := BriefcaseAccount new.
	
	aDeposit :=  Deposit register:  100 * peso on:  receptiveAccount.
	aWithdraw := Withdraw register:  50 * peso on:  receptiveAccount.
	
	aBriefcase addAccount: receptiveAccount.
	mainBriefcase addAccount: aBriefcase.
	
	self assert: (mainBriefcase hasRegistered: aDeposit).
	self assert: (mainBriefcase hasRegistered: aWithdraw).
	! !


!BriefcaseAccountTest methodsFor: 'test - errors' stamp: 'MG 11/28/2021 19:29:20'!
test08UnPortfolioVacioNoObtieneNingunaTransaccion
	
	self should:  [mainBriefcase getTransactionsOf: receptiveAccount.] 
		raise: Error  
		withExceptionDo: [: anError | 
		self assert: anError messageText equals: BriefcaseAccount briefcaseIsEmpty.
	].
	
	! !

!BriefcaseAccountTest methodsFor: 'test - errors' stamp: 'MG 11/28/2021 19:31:09'!
test09UnPortfolioNoObtieneLasTransaccionesDeUnaCuentaNoIncluidaEnElMismo
	
	| anAccountOutOfBriefcase |
	
	mainBriefcase addAccount: receptiveAccount.
	
	anAccountOutOfBriefcase := ReceptiveAccount new.
	
	self should:  [mainBriefcase getTransactionsOf: anAccountOutOfBriefcase.] 
		raise: Error  
		withExceptionDo: [: anError | 
		self assert: anError messageText equals: BriefcaseAccount accountNotIncluded.
	].
	
	! !


!BriefcaseAccountTest methodsFor: 'auxiliar' stamp: 'MG 11/27/2021 19:26:15'!
anAccountWith: TransactionType for: anAmount
	|anAccount|
	anAccount := ReceptiveAccount new.
	TransactionType register:  anAmount on: anAccount.
	^anAccount.! !


!BriefcaseAccountTest methodsFor: 'test - extra' stamp: 'MG 11/28/2021 19:32:18'!
test13UnPortfolioNoPuedeAgregarUnaCuentaYaAgregada
	
	mainBriefcase addAccount: receptiveAccount.
	
	self should: [mainBriefcase addAccount: receptiveAccount] raise:  Error withExceptionDo: [: anError |
		self assert: anError messageText equals: BriefcaseAccount accountAlredyIncluded.
	].

	! !

!BriefcaseAccountTest methodsFor: 'test - extra' stamp: 'MG 11/28/2021 19:32:12'!
test14UnPortfolioNoPuedeAgregarUnaCuentaDeUnPortfolioYaIncluido
	
	|aBriefcase |
	
	aBriefcase := BriefcaseAccount new.
	
	aBriefcase addAccount: receptiveAccount .
	mainBriefcase addAccount: aBriefcase.
	
	self should: [mainBriefcase addAccount: receptiveAccount] raise:  Error withExceptionDo: [: anError |
		self assert: anError messageText equals: BriefcaseAccount accountAlredyIncluded.
	].

	! !

!BriefcaseAccountTest methodsFor: 'test - extra' stamp: 'MG 11/28/2021 19:11:48'!
test15UnPortfolioNoPuedeAgregarseASiMismo
	
	self should: [mainBriefcase addAccount: mainBriefcase] raise:  Error withExceptionDo: [: anError |
		self assert: anError messageText equals: BriefcaseAccount canNotAddTheSameBriefcase.
	].
! !

!BriefcaseAccountTest methodsFor: 'test - extra' stamp: 'MG 11/28/2021 19:32:37'!
test16UnPortfolioNoPuedeAgregarUnaCuentaSiEstaYaPerteneceASuPortfolioPadre
	
	"
	|aBriefcase |
	
	aBriefcase := BriefcaseAccount new.
	
	mainBriefcase addAccount: aBriefcase.
	mainBriefcase addAccount: receptiveAccount.
	
	self should: [aBriefcase addAccount: receptiveAccount] raise:  Error withExceptionDo: [: anError |
		self assert: anError messageText equals: BriefcaseAccount accountAlredyIncluded.
	].
	"! !

!BriefcaseAccountTest methodsFor: 'test - extra' stamp: 'MG 11/28/2021 19:33:01'!
test17UnPortfolioNoPuedeAgregarOtroPortfolioQueTengaUnaCuentaYaIncluidaEnEl
	
	"
	|aBriefcase |
	
	aBriefcase := BriefcaseAccount new.
	
	mainBriefcase addAccount: receptiveAccount.
	aBriefcase addAccount: receptiveAccount.
	
	self should: [mainBriefcase addAccount: aBriefcase.] raise:  Error withExceptionDo: [: anError |
		self assert: anError messageText equals: BriefcaseAccount accountAlredyIncluded.
	].
	"! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MG 11/27/2021 18:36:34'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'anOriginAccount aDestinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'auxiliar' stamp: 'MG 11/28/2021 19:38:24'!
assertThatATransferCantMakeItFor: anAmount

	^ self should:  [self makeATransferFor: anAmount] 
		raise: Error  
		withExceptionDo: [: anError | 
			self assert: anError messageText equals: Transfer invalidAmount.
		]! !

!TransferTest methodsFor: 'auxiliar' stamp: 'MG 11/27/2021 19:10:06'!
makeATransferFor: anAmount
	^Transfer from: anOriginAccount to: aDestinationAccount for: anAmount! !


!TransferTest methodsFor: 'set up' stamp: 'MG 11/27/2021 19:06:22'!
setUp
	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.	! !


!TransferTest methodsFor: 'test' stamp: 'MG 11/27/2021 19:10:26'!
test01UnaTrasferenciaEntreDosCuentasSeRealizaCorrectamente
	
	self makeATransferFor: 50 * peso.
	
	self assert: -50 * peso equals: (anOriginAccount balance).
	self assert: 50 * peso equals: (aDestinationAccount balance).! !

!TransferTest methodsFor: 'test' stamp: 'MG 11/27/2021 19:10:50'!
test02DespuesDeUnaTrasferenciaSeDevuelveElValorDeLaMisma
	
	| aTransfer |
	
	aTransfer := self makeATransferFor: 50 * peso.
	
	self assert: 50 * peso equals: (aTransfer amount).
! !

!TransferTest methodsFor: 'test' stamp: 'MG 11/27/2021 19:11:35'!
test03CadaPataDeLaTransferenciaConoceSuContraparte

	|aTransfer depositLegOfTheTransfer withrawLegOfTheTransfer |
	
	aTransfer := self makeATransferFor: 50 * peso.
	
	withrawLegOfTheTransfer := aTransfer transferWithdrawLeg.
	depositLegOfTheTransfer := aTransfer transferDepositLeg.
	
	self assert: 	 depositLegOfTheTransfer equals: (withrawLegOfTheTransfer partnerOf: aTransfer)	.
		
	self assert:  withrawLegOfTheTransfer equals: (depositLegOfTheTransfer partnerOf: aTransfer).
! !

!TransferTest methodsFor: 'test' stamp: 'MG 11/28/2021 19:40:51'!
test04UnaTransferenciaNoPuedeRealizarseConMontoCero
	
	self assertThatATransferCantMakeItFor: 0 * peso.
	self assert: 0 * peso equals: (anOriginAccount balance).
	self assert: 0 * peso equals: (aDestinationAccount balance).
	! !

!TransferTest methodsFor: 'test' stamp: 'MG 11/28/2021 19:40:40'!
test05UnaTransferenciaNoPuedeRealizarseConMontoNegativo
	
	self assertThatATransferCantMakeItFor: -5 * peso.
	self assert: 0 * peso  equals: (anOriginAccount balance).
	self assert: 0 * peso equals: (aDestinationAccount balance).
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'MG 11/27/2021 18:36:21'!
value
	^value! !


!AccountTransaction methodsFor: 'operation' stamp: 'MG 11/27/2021 18:43:34'!
returnNewValueOf: theBalance
	self subclassResponsibility. ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'MG 11/27/2021 18:55:12'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'operation' stamp: 'MG 11/27/2021 18:43:34'!
returnNewValueOf: theBalance
	^theBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'accesing' stamp: 'tg 11/25/2021 20:53:17'!
partnerOf: aTransfer
	^aTransfer transferWithdrawLeg.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'as yet unclassified' stamp: 'tg 11/25/2021 20:59:12'!
for: aValue
	^ self new initializeFor: aValue.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'operation' stamp: 'MG 11/27/2021 18:43:34'!
returnNewValueOf: theBalance
	^theBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #WithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'accesing' stamp: 'tg 11/25/2021 20:53:17'!
partnerOf: aTransfer
	^aTransfer transferDepositLeg.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'as yet unclassified' stamp: 'tg 11/25/2021 20:59:28'!
for: aValue
	^ self new initializeFor: aValue ! !


!classDefinition: #BankServices category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankServices
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankServices methodsFor: 'main protocol' stamp: 'MG 11/28/2021 18:33:47'!
balance
	self subclassResponsibility.! !

!BankServices methodsFor: 'main protocol' stamp: 'MG 11/28/2021 18:33:53'!
hasRegistered: aTransaction
	self subclassResponsibility.! !

!BankServices methodsFor: 'main protocol' stamp: 'MG 11/28/2021 18:34:02'!
transactions
	self subclassResponsibility.! !


!classDefinition: #BriefcaseAccount category: 'ServiciosFinancieros-Ejercicio'!
BankServices subclass: #BriefcaseAccount
	instanceVariableNames: 'wallet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BriefcaseAccount methodsFor: 'auxiliar operations - private' stamp: 'MG 11/27/2021 18:48:49'!
registerTransactionsOf: anAccount into: aTransactionsOfWallet

	^ anAccount transactions do:[: aTransaction | 
			aTransactionsOfWallet add: aTransaction 
		]! !


!BriefcaseAccount methodsFor: 'main protocol' stamp: 'MG 11/28/2021 19:13:04'!
addAccount: anAccount 

	(self = anAccount )ifTrue: [
		^self error: self class canNotAddTheSameBriefcase.	
	].
	(self contains: anAccount )ifTrue: [
		^self error: self class accountAlredyIncluded.	
	].

	^wallet add: anAccount.! !

!BriefcaseAccount methodsFor: 'main protocol' stamp: 'MG 11/27/2021 16:16:32'!
balance
	|aBalance|
	aBalance := 0.	 
	wallet do: [:anAccount | aBalance := aBalance + anAccount balance].
	^aBalance! !

!BriefcaseAccount methodsFor: 'main protocol' stamp: 'MG 11/28/2021 19:33:48'!
getTransactionsOf: anAccount 

	self isEmpty ifTrue: [
		^ self error: self class briefcaseIsEmpty.
	].
	(self contains: anAccount) ifFalse:[
		^self error: self class accountNotIncluded.
	].
	
	^ anAccount transactions.! !

!BriefcaseAccount methodsFor: 'main protocol' stamp: 'MG 11/28/2021 18:18:32'!
hasRegistered: anTransaction
	
	| hasTransactions |
	hasTransactions := false.
	wallet do:[:anAccount | (anAccount hasRegistered: anTransaction) ifTrue:[ ^ hasTransactions := true ] ].
	^hasTransactions.! !

!BriefcaseAccount methodsFor: 'main protocol' stamp: 'MG 11/27/2021 17:59:27'!
transactions
	|aTransactionsOfWallet|
	aTransactionsOfWallet := OrderedCollection new.
	wallet do:[:anAccount | 
		self registerTransactionsOf: anAccount into: aTransactionsOfWallet.
	].
	^aTransactionsOfWallet.! !


!BriefcaseAccount methodsFor: 'testing' stamp: 'MG 11/28/2021 19:10:18'!
assertThat: anAccountInBriefcase isTheSameAs: anAccount

	(anAccountInBriefcase isKindOf: ReceptiveAccount) ifTrue:[
		^ anAccountInBriefcase = anAccount
	].
	(anAccountInBriefcase isKindOf: BriefcaseAccount ) ifTrue:[
		^ anAccountInBriefcase = anAccount or: [ anAccountInBriefcase contains: anAccount].
	].! !

!BriefcaseAccount methodsFor: 'testing' stamp: 'MG 11/28/2021 19:05:50'!
contains: anAccount
	| accountIsInBriefcase |
	
	accountIsInBriefcase := false.
	wallet do:[:anAccountInBriefcase | 
		((self assertThat: anAccountInBriefcase isTheSameAs: anAccount)) ifTrue: [^accountIsInBriefcase :=true]].
	^accountIsInBriefcase.! !

!BriefcaseAccount methodsFor: 'testing' stamp: 'MG 11/27/2021 19:38:30'!
isEmpty
	^ wallet isEmpty.! !


!BriefcaseAccount methodsFor: 'initialization' stamp: 'MG 11/27/2021 18:58:17'!
initialize

	wallet := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BriefcaseAccount class' category: 'ServiciosFinancieros-Ejercicio'!
BriefcaseAccount class
	instanceVariableNames: ''!

!BriefcaseAccount class methodsFor: 'error message' stamp: 'MG 11/27/2021 19:53:44'!
accountAlredyIncluded
	^'Cuenta ya está incluida en el portfolio'! !

!BriefcaseAccount class methodsFor: 'error message' stamp: 'MG 11/27/2021 16:58:09'!
accountNotIncluded
	^'La cuenta no está en el portfolio'! !

!BriefcaseAccount class methodsFor: 'error message' stamp: 'MG 11/27/2021 18:09:35'!
briefcaseIsEmpty
	^'El Portfolio está vacío'! !

!BriefcaseAccount class methodsFor: 'error message' stamp: 'MG 11/28/2021 19:12:33'!
canNotAddTheSameBriefcase
	^'No se puede agregar el mismo portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankServices subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MG 11/27/2021 18:43:34'!
balance

	| balance |
	balance := 0 * peso.
	transactions do: [ :aTransaction | balance := aTransaction returnNewValueOf: balance ].
	^balance.
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'MG 11/27/2021 18:25:05'!
initializeFrom: anOriginAccount to: aDestinationAccount for: 	anAmount

	amount := anAmount.
	withdrawLeg :=  WithdrawLeg register: anAmount on: anOriginAccount.
	depositLeg := 	DepositLeg register: anAmount on: aDestinationAccount.

	
! !


!Transfer methodsFor: 'accesing' stamp: 'MG 11/27/2021 18:26:21'!
amount
	^amount.
	! !

!Transfer methodsFor: 'accesing' stamp: 'MG 11/27/2021 15:59:57'!
transferDepositLeg
	^depositLeg.! !

!Transfer methodsFor: 'accesing' stamp: 'MG 11/27/2021 16:00:01'!
transferWithdrawLeg
	^withdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'error message' stamp: 'MG 11/27/2021 15:31:24'!
invalidAmount
	^'Monto de la transferencia inválido'! !


!Transfer class methodsFor: 'initialization' stamp: 'MG 11/27/2021 18:25:05'!
from: anOriginAccount to: aDestinationAccount for: anAmount 
	
	(anAmount <= 0) ifTrue:[
		^self error: self invalidAmount.
	].
	^self new initializeFrom: anOriginAccount to: aDestinationAccount for: anAmount.
	
	
! !
