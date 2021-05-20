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
    
    productXSquared: .asciiz "\n The result of x * x: "
    productXCubed: .asciiz "\n The result of x * x * x: "
    productAXCubed: .asciiz "\nThe result of ax^3: "
    productBXSquared: .asciiz "\nThe result of bx^2: "
    
    	
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
    li $v0, 5#This tells the system we want to get an integer from the keyboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t0, $v0 #moves to t0 the value stored in v0
    syscall
#------------------GETTING A FROM THE USER----------------------------------
    
    li $v0, 4 
    la $a0, inputPromptA
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t1, $v0 #moves to t1 the value stored in v0
    syscall
#--------------------GETTING B FROM THE USER--------------------------------
    
    li $v0, 4 
    la $a0, inputPromptB
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t2, $v0 #moves to t2 the value stored in v0
    syscall
    
#-----------------------GETTING C FROM THE USER-----------------------------
    
    li $v0, 4 
    la $a0, inputPromptC
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t3, $v0 #moves to t3 the value stored in v0
    syscall
#------------------------GETTING D FROM THE USER----------------------------
    
    li $v0, 4 
    la $a0, inputPromptD
    syscall
    
    #getting the users input
    li $v0, 5#This tells the system we want to get an integer from the keboard
    syscall#Pauses execution and allows us to enter a number
    
    #Store the result in $t0
    move $t4, $v0 #moves to t4 the value stored in v0
    syscall
#-----------------------COMPUTING AX^3--------------------------------------
    mul $t5, $t0, $t0#computes x * x and saves to $t5
    syscall
    
    li $v0, 4
    la $a0, productXSquared
    syscall
    
    
    li $v0, 1
    add $a0, $zero, $t5 #code to print the computation
    syscall
    
    mul $t5, $t5, $t0 #computes x cubed
    syscall
    
    li $v0, 4
    la $a0, productXCubed
    syscall
    
    li $v0, 1
    add $a0, $zero, $t5 #code to print the computation
    syscall
   
    mul $t5, $t5, $t1 #computes ax3
    syscall 
    
    
    
#-----------------------COMPUTING BX^2--------------------------------------
    mul $t6, $t0, $t0 #computes x * x and saves to $t6
    syscall
    
    li $v0, 4
    la $a0, productXSquared
    syscall
    
    
    li $v0, 1
    add $a0, $zero, $t6 #code to print the computation
    syscall
    
    mul $t6, $t2, $t6
    syscall #This generates bx^2
    
    
    
#-----------------------COMPUTING CX--------------------------------------
    	        
    mul $t3,$t0#this generates  cx
    syscall
    
    
    
#----------------------ADDING EVERYTHING----------------------------

    add $t4, $t4, $t3 #d + cx
    add	$t4, $t4, $t6 #d + cx + bx2
    add $t4, $t4, $t5 #d + cx + bx2 + ax3
    syscall
    
    
    
    
