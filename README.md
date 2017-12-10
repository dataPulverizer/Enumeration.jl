# Enumeration.jl, A C++ class style enums for Julia, written in Julia v0.7.0-DEV

You're asking yourself *"Julia already has `enum` functionality, why do I need `Enumeration.jl`?"*. Well `Enumeration.jl`:

* Encapsulates names away from code. This allows you to reuse the name in the enums as variables if you so wish.
* Unabiguous when you are referring to `Fruits("apple")` not `Stocks("apple")` for instance.
* You can evaluate that `Fruits("apple") != Stocks("apple")`.

`Enumeration.jl` thus presents a much **safer** and **cleaner** programmer friendly interface to enums than the current built-in `Base` implementation.

The usage of `Enumeration.jl` is based around the `Enumerate(name::Symbol, data = Dict{T, Int})` function allowing you to use any type as `T` for the identifier in the dictionary and the value is an integer. The `name` argument is the type name of the enumeration. See the example below:

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

julia> myFruit == 4
true

julia> myFruit == 3
false

julia> 4 == myFruit
true
```

Enjoy

DP
