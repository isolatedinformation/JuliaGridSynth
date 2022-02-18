abstract type AbstractGate end
Base.adjoint(::AbstractGate) = error("not implemented")
matrix(::AbstractGate) = error("not implemented")

struct HGate <: AbstractGate end
const HMatrix = ComplexF64[1 1; 1 -1] ./ convert(ComplexF64, sqrt(2))
matrix(::HGate) = HMatrix

struct XGate <: AbstractGate end
const XMatrix = ComplexF64[0 1; 1 0]
matrix(::XGate) = XMatrix
X = XGate()

struct YGate <: AbstractGate end
const YMatrix = ComplexF64[0 -im; im 0]
matrix(::YGate) = YMatrix
Y = YGate()

struct ZGate <: AbstractGate end
const ZMatrix = ComplexF64[1 0; 0 1]
matrix(::ZGate) = ZMatrix
Z = ZGate()

struct SGate <: AbstractGate end
const SMatrix = ComplexF64[1 0; 0 im]
matrix(::SGate) = SMatrix
S = SGate()

struct SdagGate <: AbstractGate end
const SdagMatrix = ComplexF64[1 0; 0 -im]
matrix(::SdagGate) = SdagMatrix
Sdag = SdagGate()

struct TGate <: AbstractGate end
const TMatrix = ComplexF64[1 0; 0 Base.exp(im * π / 4)]
matrix(::TGate) = TMatrix
T = TGate()

struct TdagGate <: AbstractGate end
const TdagMatrix = ComplexF64[1 0; 0 Base.exp(-im * π / 4)]
matrix(::TdagGate) = TdagMatrix
Tdag = TGate()

struct RZGate
    θ::Vector{Float64}

    function RZGate(θ::Real)
        new([θ])
    end
end

function matrix(g::RZGate)
    m = zeros(ComplexF64, (2, 2))
    eθ = exp(im * g.θ[] / 2)
    m[1, 1] = conj(eθ)
    m[2, 2] = eθ
    m
end

