#==
  C++ class style enums for Julia, written in Julia v0.7.0-DEV
  Created 10th December 2017
==#

abstract type Enumeration{T} end

function Enumerate(name::Symbol, data::Dict{T, Int})::Void where T
  enumExpression = quote
    struct $name{T} <: Enumeration{T}
      value::Int
      data::Dict{T, Int}
      function $name(x::T) where T
        value::Int = $data[x]
        new{T}(value, $data)
      end
    end
  end

   #==
     There is a default equality expression, this one overrides it.
   ==#

   equalityExpression = quote
     import Base.==
     ==(x::$name, y::$name) = x.value == y.value
     ==(x::$name, y::Int) = x.value == y
     ==(y::Int, x::$name) = x.value == y
   end

   eval(Main, enumExpression)
   eval(Main, equalityExpression)
   return
end

#== Example:

julia> include("Enumeration.jl")

julia> Enumerate(:Fruit, Dict("apple" => 1, "orange" => 2, "pear" => 3, "guava" => 4))

julia> myFruit = Fruit("guava")
Fruit(1, Dict("guava"=>4,"orange"=>2,"pear"=>3,"apple"=>1))

julia> yourFruit = Fruit("pear")
Fruit(3, Dict("guava"=>4,"orange"=>2,"pear"=>3,"apple"=>1))

julia> yourFruit == myFruit
false

julia> myFruit == Fruit("guava")
true

julia> myFruit == 4
true

julia> myFruit == 3
false

julia> 4 == myFruit
true
==#
