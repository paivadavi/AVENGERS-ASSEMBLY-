.data
promptA: .asciiz "\n Insert a value for input A "
promptB: .asciiz "\n Insert a value for Enter input B "
promptC: .asciiz "\n Insert a value for Enter input C "
promptD: .asciiz "\n Insert a value for Enter input D "
promptX: .asciiz "\n Insert a value for Enter input X "
Output: .ascii "\nThe output is: "

.text 

la $a0, promptX 
li $v0, 4 #This tells the system to print a word
syscall #executes loaded system service

li $v0,5 
syscall
move $t0, $v0 #moving data loaded to $v0 to $t0


la $a0, promptA
li $v0, 4
syscall
li $v0,5
syscall
move $t1, $v0


la $a0, promptB
li $v0, 4
syscall
li $v0,5
syscall
move $t2, $v0


la $a0, promptC
li $v0, 4
syscall
li $v0,5
syscall
move $t3, $v0


la $a0, promptD
li $v0, 4
syscall
li $v0,5
syscall
move $t4, $v0


mul $t5, $t4, $t4 #multiplies X by X and saves the result in $t5
mul $t5, $t5, $t4 #computes X * X
mul $t5, $t5, $t0 #computes ax3
#
mul $t6, $t4, $t4  
mul $t6, $t6, $t1 
#
mul $t7, $t4, $t2 
#
add $t5, $t5, $t6
add $t5, $t5, $t7
add $t5, $t5, $t3
#
la $a0, Output
li $v0, 4 #instruction for printing a string
syscall

move $a0, $t5
li $v0, 1 #service to print integer
syscall
#
li $v0, 10 #exit instruction
syscall 