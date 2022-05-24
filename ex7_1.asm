.data
	prompt_number: .asciiz "\nPlease input a number: "
	remainder_text: .asciiz "\nRemainder of division by 2: "
	even_text: .asciiz "\n\nEVEN NUMBER"
	odd_text: .asciiz "\n\nODD NUMBER"
	
.text
	li $v0, 4
	la $a0, prompt_number
	syscall
	
	li $v0, 5
	syscall

	move $t0, $v0
	addi $t1, $zero, 2 #allocating the value of 2 to $t1
	div $t0, $t1 #Division with overflow -> remainder goes to hi
	mfhi $s0 #s0 now holds the remainder
	
	li, $v0, 4
	la, $a0, remainder_text
	syscall
	
	li, $v0, 1
	add $a0, $zero, $s0
	syscall
	
	#----------CHECKING IF REMAINDER == 0----------
	
	beq $s0, $zero, evenNumber #If the two values are equal, it will branch
	 
	
	#----------CHECKING IF REMAINDER != 0------------
	
	bnez $s0, oddNumber
	
	li $v0, 10
	syscall #Prevents the labels below from being executed by accident
	
	evenNumber:
		li $v0, 4
		la $a0, even_text
		syscall
		
		li $v0, 10 #Specifying that program ends here
		syscall
	
	oddNumber:
		li $v0, 4
		la $a0, odd_text
		syscall
		
		li, $v0, 10
		syscall #specifying that the program ends here
		
		
	
	
	
	
	
	