# Enumeration.jl, A C++ class style enums for Julia, written in Julia v0.7.0-DEV

Based around the `Enumerate` function that generates a type based on a dictionary `Dict{T, Int}` which defines 
the enum, and a `Symbol` that defines the name of the enum.

## Example:

Shows example with `Dict{String, Int}`, but could as well work with any `T` for `String`.

```
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
```

Enjoy

DP
