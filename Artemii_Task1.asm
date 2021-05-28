#Assembly programming Task 1 Artemii Pavlovskyi 257802
.data #declaring the variable part
A: .asciiz "Enter input A " #string with \n
B: .asciiz "Enter input B "
C: .asciiz "Enter input C "
D: .asciiz "Enter input D "
X: .asciiz "Enter input X "
Output: .ascii "The output is: " #string with no \n
.text #declaring code part
#
la $a0, A #loading the string A in the address $a0
li $v0, 4 #loading the instruction 4 (print String) from $a0
syscall #executes loaded instruction
li $v0,5 #reading the integer value to $v0
syscall
move $t0, $v0 #moving data loaded to $v0 to $t0
#
la $a0, B
li $v0, 4
syscall
li $v0,5
syscall
move $t1, $v0
#
la $a0, C
li $v0, 4
syscall
li $v0,5
syscall
move $t2, $v0
#
la $a0, D
li $v0, 4
syscall
li $v0,5
syscall
move $t3, $v0
#
la $a0, X
li $v0, 4
syscall
li $v0,5
syscall
move $t4, $v0
#
mul $t5, $t4, $t4 #multiplies X by X and saves the result in $t5
mul $t5, $t5, $t4 #multiplies (X by X) from previous instruction by X and saves it to $t5
mul $t5, $t5, $t0 #multiplies the result from the previous instruction by A and saves it to $t5
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
li $v0, 4 #instruction of printing a string
syscall
move $a0, $t5
li $v0, 1 #print int
syscall
#
li $v0, 10 #exit instruction
syscall 