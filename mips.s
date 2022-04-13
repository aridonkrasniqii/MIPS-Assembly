
.text
.globl main

main:

la $a0 , array                           # first arr address
la $a1 , 6                               # initialize n = 6

jal largest                              # jump and load address to function

j finalexit                              # when function is returned jump to finalexit

largest:                                 # function largest

move $s0 , $a0                           # first arr address
lw $t8 , 4($s0)                          #  max = array[0]
move $t6 , $a1                           # int n
 
addi $t1, $t1, 0                         # int  i = 1

        loop:

            slti $t2 , $t1 , 6           # if $t1 < 5 ? $t2 = 1 : $t2 = 0
            beq $t2, $zero , exit        # if $t2 = 0 jump to exit

            lw $t0 , 0($s0)              # loads member of array

            addi $s0 , $s0 , 4           # increment $s0 to go to next member of array
            addi $t1, $t1, 1             # i ++

            slt $t9 , $t0 , $t8          # $ t0 < $t8 ? $t9 = 1 : $t9 = 0
            bne $t9 , $zero ,loop        # if $t9 != 0 jump to loop
            move $t8 , $t0               # max = arr[i]

        j loop

        exit:

jr $ra

finalexit:

    li $v0 , 4
    la $a0 , str
    syscall

    li $v0, 1
    move $a0 , $t8
    syscall

.data

array: .word 2222, 1, 53, 444, 5, 232
str: .asciiz "Largest in given array is: "
