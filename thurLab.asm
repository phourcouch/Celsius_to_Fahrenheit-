.data 

prompt: .asciiz "Please input a temperature in Celsius => "

output: .asciiz "\nThe temperature in Fahrenheit is: => "

covert_num: .float 1.8 #9/5

addition: .float 32 
.text 

main: 

li $v0,4
la $a0,prompt #prompt user to input temp in Celsius
syscall 

li $v0,5
syscall

add $t0,$v0,$0  #celsuis num

mtc1 $t0,$f0 #move int into float processor 
cvt.s.w $f0,$f0 #data conversion



l.s $f1, covert_num #set $f1 to 1.8 
l.s $f2, addition #set $f2 to 32
 
mul.s $f12,$f0, $f1 #multiply user's input and 1.8 ( 9/5) and set $f12 to it

li $v0,4
la $a0,output #print out output 
syscall 

add.s $f12, $f12,$f2 #adding 32 to $f12

li $v0,2 #print out float
syscall

li $v0,10 #close program
syscall
