# """
# In this we are building extensions to rings of integers are in Definition 3.1
# """
# using AbstractAlgebra

# # https://docs.juliahub.com/AbstractAlgebra/b8V2b/0.17.1/mpolynomial_rings/, check this for implementing multivariate polynomial rings ! 
# QuadracticRing, (x, y) = PolynomialRing(ZZ, ["x", "y"])

abstract type AbstractRing end


struct Ring{T} <: AbstractRing
    value::T
    function Ring{T}(value::T) where {T<:Number}
        new{T}(value)
    end
end

function Ring(value::T) where {T<:Integer}
    Ring{T}(value)
end

function IntegerRing(value::Int64)
    Ring{Int64}(value)


struct QuadraticIntegerRing <:AbstractRing
    a::Ring{Int64}
    b::Ring{Int64}
    radicand::Int64
    QuadraticIntegerRing(a, b, c) where {a::Ring{Int64},b::Ring{Int64},radicand::Int64} = new(a, b, c)
end

function QuadraticIntegerRing(a::Int64, b::Int64, radicand::Int64)
    QuadraticIntegerRing(Ring{Int64}(a), Ring{Int64}(b), radicand)
end

function generate_QuadracticIntegerRing_element(radicand::Int64, start::Int64 = -100, end::Int64 = 100)
    a = Ring{Int64}(rand(start:end))
    b = Ring{Int64}(rand(start:end))
    QuadraticIntegerRing(a,b, radicand)
end

#TODO: Define operations between ring elements: Addtion,Adjoint, Automorphism
const OMEGA = exp(im*pi/4)

struct OmegaIntegerRing <:AbstractRing
    values::Vector{Ring{Int64}}
    OmegaIntegerRing(values) where values::Vector{Ring{Int64}} = new(values)
end

function OmegaIntegerRing(values::Vector{Int64})
    vals = []
    for val in values
        append!(vals, Ring{Int64}(val))
    end
    OmegaIntegerRing(vals)
end

struct DyadicFractionRing <: AbstractRing
    a::Int64
    k::UInt64 # Unsigned integer because the k must be natural number
    DyadicFractionRing(a,k) where {a::Int64, k::UInt64} = new(a,k)
end

function DyadicFractionRing(a::Int64, k::Int64)
    if k<=0
        error("k must be a natural number")
    end
    DyadicFractionRing(a,convert(::UInt64,k))
end