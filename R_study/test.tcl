# Examples from <<Practical Programming in Tcl&Tk, 3rd edition>>
puts stdout {Hello, World!}

set var 5
set b $var
puts stdout $var

set len [string length foobar]
puts stdout $len

set res [expr 7.2/4]
puts stdout $res

set x 7
set res [expr [string length foobar] + $x]
puts stdout $res

set pi [expr 2*asin(1.0)]
puts stdout $pi

set escape \u001b
puts stdout $escape
set escape \0x1b
puts stdout $escape
set escape \033
puts stdout $escape

set one good
set two end
set totalLength [expr [string length $one] + \
     [string length $two]]
puts stdout $totalLength

set s Hello
puts stdout "The length of $s is [string length $s]."
puts stdout {The length of $s is [string length $s].}

set name potato
set value 36.5
puts [format "Item: %s\t%5.3f" $name $value]

set x 7; set y 9
puts stdout $x+$y=[expr $x + $y]
puts stdout "$x + $y = [expr $x + $y]"
puts stdout "$x + $y = [expr {$x + $y}]"

proc Diag {a b} {
   set c [expr sqrt($a * $a + $b * $b)]
   return $c
}
puts "The diagonal of a 3, 4 right triangle is [Diag 3 4]"

proc Factorial {x} {
   set i 1; set product 1
   while {$i <= $x} {
      set product [expr $product * $i]
      incr i
   }
   return $product
}
puts "The result is [Factorial 10]"

proc Factorialrc {x} {
   if {$x <= 1} {
      return 1
   } else {
      return [expr $x * [Factorialrc [expr $x - 1]]]
   }
}
puts "The result from the recursive algorithm is [Factorialrc 10]"

puts " one divided by three equals to [expr 1 / 3.0]"
set tcl_precision 17
puts " one divided by three equals to [expr 1 / 3.0], a higher precision"

# Tcl script to echo command line arguments
# puts "Program: $argv0"
# puts "Number of arguments: $argc"
# set i 0
# foreach arg $argv {
#    puts "Arg $i: $arg"
#    incr i
# }


