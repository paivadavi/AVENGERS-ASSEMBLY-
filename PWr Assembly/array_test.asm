.data

	#Purpose: Ask the user for n < 10 and get n values and store them in an array
    myArray: .space 40 #4 * 10
    nPrompt: .asciiz "\nInsert a value < 10: "
    numberPrompt: .asciiz "\nInsert a value: "
	
.text
    
    addi $t0, $zero, 0#making t0 = 0 to use as iterator
    
    li $v0,4
    la $a0, nPrompt
    syscall
    
    li $v0, 5
    syscall
    
    move $v0, $t1
    
    mul $t1, $t1, 4
    
#-----------------------------Getting numbers and storing them in the array-------------------------------
    While:
    	beq $t0, $t1, exit
    	mul $t2, $t0, 4
    	
    	li $v0, 4
    	la $a0, numberPrompt
    	syscall
    	
    	li $v0,5
    	syscall
    	
    	move $t3, $v0
    	sw $t3, myArray($t2)
    	
    	
    	addi $t0, $t0, 1
    	j While	
    exit:
    
    
    
    
