module JuliaGridSynth

using LinearAlgebra
using SparseArrays
# Write your package code here.
include("Gates.jl")
export
    AbstractGate,
    X,
    Y,
    Z,
    H,
    S,
    Sdag,
    T,
    Tdag,
    XGate,
    YGate,
    ZGate,
    HGate,
    SGate,
    TGate,
    SdagGate,
    TdagGate,
    RZGate,
    matrix

end
