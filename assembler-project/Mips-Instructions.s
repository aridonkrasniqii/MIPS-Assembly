
  .text
  .globl main

  main:

  la $a0 , array                           # first array address
  la $a1 , 8                               # initialize int n = 6

  jal largest                              # jump and link  to function largest

  j finalexit                              # when function is returned jump to finalexit

  largest:                                 # function largest

  move $s0 , $a0                           # first address array
  lw $t8 , 4($s0)                          # initialize int max = array[0]
  move $t6 , $a1                           # int n

  addi $t1, $t1, 0                         # initialize int  i = 1

          loop:                            # for loop

              slti $t2 , $t1 , 8           # if $t1 < 6 ? $t2 = 1 : $t2 = 0 | for (int i  = 1 ; i < n ; i++)
              beq $t2, $zero , exit        # if $t2 = 0 jump to exit

              lw $t0 , 0($s0)              # load member of array

              addi $s0 , $s0 , 4           # increment $s0 to go to next member of array
              addi $t1, $t1, 1             # increment i = i + 1

              slt $t9 , $t0 , $t8          # $ t0 < $t8 ? $t9 = 1 : $t9 = 0 | if (array[i]  > max )
              bne $t9 , $zero ,loop        # if $t9 != 0 jump to loop
              move $t8 , $t0               # initialize max = arr[i]

          j loop

          exit:

  jr $ra

  finalexit:

      li $v0 , 4                          # print Largest in given array is:
      la $a0 , str
      syscall

      li $v0, 1                           # print max value of array
      move $a0 , $t8
      syscall

  .data

  array: .word 20, 45, 14, 4, 5, 1, 254, 365
  str: .asciiz "Largest in given array is: "
