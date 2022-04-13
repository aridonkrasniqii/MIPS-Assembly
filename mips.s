
.text
.globl main

main:

# get first address of array
la $a0 , array


# initialize n = 5
la $a1 , 6



jal largest

j finalexit



largest:

move $s0 , $a0
lw $t8 , 4($s0) # storing max = array[0]
move $t6 , $a1

# int  i = 1
addi $t1, $t1, 1


        loop:

            # if $t1 < 5 ? $t2 = 1 : $t2 = 0
            slt $t2 , $t1 , $t6
            beq $t2, $zero , exit



            # get member of array
            lw $t0 , 0($s0)

            # increment $s0 to go to other member of array
            addi $s0 , $s0 , 4


            # $ t0 < $t8 ? $t9 = 1 : $t9 = 0
            # $t0 = arr[i] , max = $t8
            # if (arr[i] > max ) max = arr[i]
            slt $t9 , $t0 , $t8
            bne $t9 , $zero ,loop
            move $t8 , $t0

             #   i = i + 1
            addi $t1, $t1, 1
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

array: .word 2, 1, 3, 4, 5, 232
str: .asciiz "Largest in given array is: "
