import Pkg;
Pkg.add("Optim");
using DataFrames
using Optim

"""
Calculates the group velocities for slow waves.
"""
function vgs(θ, cs, ca=1)
    cm = sqrt(cs^2 + ca^2) #: magnetosonic speed
    cm2 = cs^2 + ca^2
    cn2 = sqrt(cm^4 - 4 * cs^2 * ca^2 * cos(θ)^2)

    Vps = sqrt(0.5 * (cm2 - cn2))
    Vgs_para = Vps * cos(θ) * (1 + cs^2 * ca^2 / Vps^2 / cn2 * sin(θ)^2)
    Vgs_perp = Vps * sin(θ) * (1 - cs^2 * ca^2 / Vps^2 / cn2 * cos(θ)^2)
    return Vgs_para, Vgs_perp
end

"""
Calculates the group velocities propagation angle for slow waves.
"""
function vgs_angle(θ, cs, ca=1)
    Vgs_para, Vgs_perp = vgs(θ, cs, ca)
    return atan(Vgs_perp, Vgs_para)
end

"""
Calculates the group velocities for MHD waves.
"""
function group_velocity(wave::AbstractMHDWaves)
    cms = sqrt(wave.cs^2 + wave.ca^2) #: magnetosonic speed
end

"""
Calculates the phase velocities and group velocities for fast and slow waves.
"""
function calc_VpVg_fastandslow(cs, ca, θ)
    cm = sqrt(cs^2 + ca^2) #: magnetosonic speed
    cm2 = cs^2 + ca^2
    cn2 = @. sqrt(cm^4 - 4 * cs^2 * ca^2 * cos(θ)^2)

    Vpi = @. ca * abs(cos(θ))
    Vps = sqrt.(0.5 * (cm2 .- cn2))
    Vpf = sqrt.(0.5 * (cm2 .+ cn2))

    Vpi_para = @. Vpi * cos(θ)
    Vpi_perp = @. Vpi * sin(θ)

    Vps_para = @. Vps * cos(θ)
    Vps_perp = @. Vps * sin(θ)

    Vpf_para = @. Vpf * cos(θ)
    Vpf_perp = @. Vpf * sin(θ)

    Vgs_perp = @. Vps * sin(θ) * (1 - cs^2 * ca^2 / Vps^2 / cn2 * cos(θ)^2)
    Vgs_para = @. Vps * cos(θ) * (1 + cs^2 * ca^2 / Vps^2 / cn2 * sin(θ)^2)

    Vgf_perp = @. Vpf * sin(θ) * (1 + cs^2 * ca^2 / Vpf^2 / cn2 * cos(θ)^2)
    Vgf_para = @. Vpf * cos(θ) * (1 - cs^2 * ca^2 / Vpf^2 / cn2 * sin(θ)^2)

    intermediate_wave_p = (
        wave = "Intermediate Waves",
        type=  "phase velocity",
        v_parp = Vpi_para,
        v_perp = Vpi_perp
    )

    intermediate_wave_g = (
        wave = "Intermediate Waves",
        type=  "group velocity",
        v_parp = ca,
        v_perp = 0
    )

    fast_wave_p = (
        wave = "Fast Waves",
        type=  "phase velocity",
        v_parp = Vpf_para,
        v_perp = Vpf_perp
    )

    fast_wave_g = (
        wave = "Fast Waves",
        type=  "group velocity",
        v_parp = Vgf_para,
        v_perp = Vgf_perp
    )

    slow_wave_p = (
        wave = "Slow Waves",
        type=  "phase velocity",
        v_parp = Vps_para,
        v_perp = Vps_perp
    )

    slow_wave_g = (
        wave = "Slow Waves",
        type=  "group velocity",
        v_parp = Vgs_para,
        v_perp = Vgs_perp
    )

    return (
        fast_wave_g, fast_wave_p,
        slow_wave_g, slow_wave_p,
        intermediate_wave_p, intermediate_wave_g
    )
end

function calc_VpVg_fastandslow(cs, ca)
    θs = 0:0.02:2π
    return calc_VpVg_fastandslow(cs, ca, θs)
end

calc_VpVg_fastandslow(cs) = calc_VpVg_fastandslow(cs, 1)

function VpVg_fastandslow_df(cs)
    dfs = cs |> calc_VpVg_fastandslow .|> pairs .|> DataFrame
    df = vcat(dfs...)
    df.cs .= cs
    return df
end

function maximum_vgs_angle(cs; ca=1)
    f(θ) = -abs(vgs_angle(θ, cs, ca))
    res = optimize(f, 0, π/2)
    return res.minimizer 
end



"""
Abstract MHD wave
"""
abstract type AbstractMHDWaves end

struct FastWave <: AbstractMHDWaves
    cs::Float64
    ca::Float64
    cms::Float64
end

struct SlowWave <: AbstractMHDWaves
    cs::Float64
    ca::Float64
    cms::Float64
end

"""
Calculates the phase velocities for MHD waves.
"""
function phase_velocity(wave::SlowWave, θ)
    cm = wave.cms #: magnetosonic speed
    cs = wave.cs
    ca = wave.ca

    cn2 = @. sqrt(cm^4 - 4 * cs^2 * ca^2 * cos(θ)^2)
    Vps = @. sqrt(0.5 * (cm^2 - cn2))

    return Vps.*cos.(θ), Vps.*sin.(θ)
end


for sym in [:SlowWave, :FastWave]
    @eval function $sym(cs, ca)
        cms = sqrt(cs^2 + ca^2) #: magnetosonic speed
        return $sym(cs, ca, cms)
    end

    @eval $sym(cs) = $sym(cs, 1)
end