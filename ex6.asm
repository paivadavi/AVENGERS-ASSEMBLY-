.data
	prompt_a: .asciiz "Enter a value for a: "
	prompt_b: .asciiz "Enter a value for b: "
	prompt_c: .asciiz "Enter a value for c: "
	prompt_d: .asciiz "Enter a value for d: "
	result_message: .asciiz "\nFinal Result: "
.text
	#------------------------A----------------------
	#Prompt the user for a
	li $v0, 4
	la $a0, prompt_a
	syscall
	
	#Retrieve a from the console
	
	li $v0, 5 #Code to read an integer
	syscall
	
	#Store the result in $t0
	move $t0, $v0
	#-------------------------A-----------------------
	
	#-------------------------B-----------------------
	#Prompt the user for b
	li $v0, 4
	la $a0, prompt_b
	syscall
	
	li $v0,5 #Code to read an integer
	syscall
	
	#Store the result in $t1
	move $t1, $v0
	#-------------------------B-----------------------
	
	#-------------------------C-----------------------
	#Prompt the user for c
	li $v0, 4
	la $a0, prompt_c
	syscall
	
	li $v0, 5
	syscall #code to read an integer
	
	#Store the result in $t2
	move $t2, $v0
	#-------------------------C-----------------------
	
	#-------------------------D-----------------------
	li $v0, 4
	la $a0, prompt_d
	syscall
	
	li $v0, 5
	syscall #Code to read an integer
	
	#Store the result in $t3
	move $t3, $v0
	
	#-------------------------D-----------------------
	
	#------------------PERFORMING CALCULATIONS--------
	
	#(a+b)
	add $s0, $t0, $t1 #Basically: s0 = t0 + t1
	
	#(c-d)
	sub $s1, $t2, $t3 #Basically: s1 = t2 - t3
	
	#(a+c)
	add $s2, $t0, $t2 #Basically: s2 = t0 + t2
	
	#(c-d) * (a+c)
	mul $s3, $s1, $s2
	
	
	#Final result = s0 - s1  
	sub $s4, $s0, $s3	
	
	#---------------------PRINTING RESULT-------------
	li $v0, 4
	la $a0, result_message
	syscall
	
	li $v0, 1
	move $a0, $s4 #Moving to a0 the value inside s4
	syscall
	