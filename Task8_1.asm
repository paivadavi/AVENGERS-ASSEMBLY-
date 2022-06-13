.data
	prompt_number: .asciiz "\nInsert a number: "
	factorial: .asciiz "Factorial = "
.text
	#----------Getting number from input----------
	li $v0, 4
	la $a0, prompt_number
	syscall
	
	li $v0, 5
	syscall
	
	addi $t0, $v0, 1 #here I initiate $t0 to x + 1
	#because $s0 is starting from 1, not 0
	
	# initiate $s1 to 1
	addi $s1, $zero, 1
	
	#initiate $s0 to 1
	add $s0, $zero, 1
	
	#Checking for next iteration
	forloop: beq $s0, $t0, done 
	
		#multiplying next number
		
		mult $s1, $s0 #multiplying by current number
		
		mflo $s1 #assigning multiplication result to s1
		
		#increasing i by 1
		addi $s0, $s0, 1
	
		j forloop #next iteration 
	done:
		li $v0, 4
		la $a0, factorial
		syscall
		
		li $v0, 1
		move $a0, $s1 #prints the factorial
		syscall
		
		li $v0, 10 #to end the program 
		syscall
		
	# result is ready
