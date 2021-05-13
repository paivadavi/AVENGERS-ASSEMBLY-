#First we need word to get user input
.data
    introMessage: .asciiz "\n---------Program to calculate a polynomial-----------\n"
    inputPrompt: .asciiz "\nInsert coefficient values for a polynomial of the form ax^3 + bx^2 + cx + d.\n" 		
    inputPromptX: .asciiz "\nInsert a value for x: \n"
    inputPromptA: .asciiz "\nInsert a value for a: \n"
    inputPromptB: .asciiz "\nInsert a value for b: \n"
    inputPromptC: .asciiz "\nInsert a value for c: \n"
    inputPromptD: .asciiz "\nInsert a value for d: \n"
    
    productAX: .asciiz "\nThe result of a * x : "
    productBX: .asciiz "\nThe result of b * x: "
    productCX: .asciiz "\nThe result of c * x: "
    
    productAX3: .asciiz "\nThe result of ax^3: "
    productBX2: .asciiz "\nThe result of bx^2: "
    
    	
.text
    li $v0, 4 #By doing this the system will know you want to print a value to the screen
    la $a0, introMessage #messages need to be put in a0
    syscall #prints the intro message
    
    li $v0, 4
    la $a0, inputPrompt
    syscall #prints the prompting message
    
    #GETTING X FROM THE USER
    
    li $v0, 4 
    la $a0, inputPromptX
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t0, $v0 #moves to t0 the value stored in v0
    
#------------------GETTING A FROM THE USER----------------------------------
    
    li $v0, 4 
    la $a0, inputPromptA
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t1, $v0 #moves to t1 the value stored in v0
    
#--------------------GETTING B FROM THE USER--------------------------------
    
    li $v0, 4 
    la $a0, inputPromptB
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t2, $v0 #moves to t2 the value stored in v0
    
    
#-----------------------GETTING C FROM THE USER-----------------------------
    
    li $v0, 4 
    la $a0, inputPromptC
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t3, $v0 #moves to t0 the value stored in v0
    
#------------------------GETTING D FROM THE USER----------------------------
    
    li $v0, 4 
    la $a0, inputPromptD
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t4, $v0 #moves to t0 the value stored in v0
    
#-----------------------COMPUTING AX^3--------------------------------------
    
    mult $t0,$t1 #The product will be in the lo register
    mflo $s0 #Here we have ax
    
    #Displays the computation to the screen
    li $v0,4
    la $a0, productAX
    syscall
    
    li $v0, 1 #this is the code to display the number on screen
    add $a0, $zero, $s0
    syscall
    
    move $s0, $t7
    mult $s0, $t7
    mflo $s0
    syscall
    
    #Displays the computation to the screen
    li $v0,4
    la $a0, productAX3
    syscall
    
    li $v0, 1 #this is the code to display the number on screen
    add $a0, $zero, $s0
    syscall
      
    
#-----------------------COMPUTING BX^2--------------------------------------
    
    mult $t0,$t2 #The product will be in the lo register
    mflo $s0 #Here we have ax
    
    #Displays the computation to the screen
    li $v0,4
    la $a0, productBX2
    syscall
    li $v0, 1 #this is the code to display the number on screen
    add $a0, $zero, $s0
    syscall    
    
#-----------------------COMPUTING CX--------------------------------------
    
    mult $t0,$t3 #The product will be in the lo register
    mflo $s0 #Here we have ax
    
    #Displays the computation to the screen
    li $v0,4
    la $a0, productCX
    syscall
    li $v0, 1 #this is the code to display the number on screen
    add $a0, $zero, $s0
    syscall	        
    
    
    
    