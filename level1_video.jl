println("Hello World!")

number_variable = 100

my_pi = 3.14

my_name = "Nikita"

println(join(join([typeof(number_variable), typeof(my_pi), typeof(my_name)], ", ")))

number_variable = my_name

println(typeof(number_variable))

# comment

#=
multiline comment
=#

println(3 + 7)
println(10 - 7)
println(20 * 5)
println(50 / 5)
println(2^10)
println(9%2)


# Strings

s1 = "I am a sting"
s2 = """I am also a string"""
s3 = """This is a "error" """

println(s3)

ch = 'a'

println("My name is $my_name")
println("Pi is $pi and doubled pi is $(pi * 2)")

concat = string(s1, s2, s3)

println(concat)
println(s1*s2)
println("$s1 $s2")


# Data structures 

d = Dict("a" => 1, "b" => 2)

println(d)

d["c"] = 3
# error: d["d"] = "4"

println(d)

println(d["c"])

pop!(d, "c")

# error: println(d["c"])
println(d)



tuple = ("a", "b", "c")

println(tuple[1])

println(typeof(tuple), "\n", tuple)
# error: tuple[1] = "d"


array = ["a", "b", "c"]
println(typeof(array), "\n", array)

num_arr = [1, 2, 3, 4]
println(typeof(num_arr), "\n", num_arr)

mix = [1, 'c', "word"]
println(typeof(mix), "\n", mix)

println(mix[3])

mix[3] = 3

println(mix)


push!(mix, 4)
println(mix)

pop!(mix)
println(mix)

arr2d = [[1, 2], [1], [1, 2, 3]]

println(typeof(arr2d), "\n", arr2d)

rarr = rand(2, 3)

println(typeof(rarr), "\n", rarr)


# Loops

let n = 0
    while n < 10
        n += 1
        println(n)
    end
end

i = 0
while i < 5
    global i
    i += 1
    println(i)
end

for i in 1:10
    println("for ", i)
end

names = ["Boris", "Artem", "Vlad"]

for name in names
    println("Hello $(name)!")
end


n, m = 5, 5
A = zeros(n, m)

for i in 1:n
    for j in 1:m
        A[i, j] = i + j
    end
end

println(A)
println(typeof(A))


B = zeros(n, m)

for i in 1:n, j in 1:m
    B[i, j] = i + j
end

println(B)


C = [i + j for i in 1:n, j in 1:m]
println(C)

for n in 1:10
    lA = [i + j for i in 1:n, j in 1:n]
    display(lA)
end


# conditions

for i in 1:3
    if i == 1
        println(i == 1)
    elseif i == 2
        println("i == 2")
    else
        println("i == $i")
    end

    println(i == 3 ? "3!" : "not 3")

    (i == 3) && println("print 3")
end


# functions

function sayhi(name)
    println("Hi $name")
end

sayhi("Nikita")


sayhishort(name) = println("Hi $name")

sayhishort("Boris")

sayhilambda = name -> println("Hi $name")

sayhilambda("Tarry")


sayhi(3)


v = [3, 5, 2]
println(v)
println(sort(v))
println(v)

sort!(v)
println(v)


f = x -> x*x

A = [i + 3*j for j in 0:2, i in 1:3]
println(A)

println(f(A))

println(f.(A))


# packages

import Pkg
Pkg.add("Example")

using Example
println(hello("me"))


Pkg.add("Colors")
using Colors

palette = distinguishable_colors(100)
# display(palette)


# Plotting

Pkg.add("Plots")
using Plots

x = -3:0.1:3
y = f.(x)
println(y)

gr()

plot(x, y, label="line")
scatter!(x, y, label="points")


# Multiple dispatch

# Pkg.add("InteractiveUtils")
using InteractiveUtils

methods(+)

println(@which 3 + 3)
println(@which 3.0 + 3.0)
println(@which 3 + 3.0)


import Base: +

+(x::String, y:: String) = string(x, y)
println("hello " + "world!")

println(@which "a" + "b")


# Basic linear algebra

A = rand(1:4,3,3)
println(A)

B = A
C = copy(A)
println([ B C ])

A[1] = 17

println([B C])


x = ones(3)

b = A*x
println(b)

Asym = A + A'
println(Asym)