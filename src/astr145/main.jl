using Unitful, UnitfulAstro
using Unitful: mp, G, c
using UnitfulAstro: Msun

σT = 6.65e-25u"cm^2" # Thomson cross section

const L_edd_Msun = 1.26e38u"erg/s"

"""
    eddington_luminosity(M, [kappa = σT/mp])

Calculate the Eddington luminosity for a given mass ``L = 4 * pi * G * M * c / \\kappa``
"""
function eddington_luminosity(M, kappa = σT/mp)
    L = 4 * pi * G * M * c / kappa
    uconvert(u"erg/s", L)
end

"""Eddington luminosity scaled by solar mass"""
eddington_luminosity(M::Number) = L_edd_Msun * M
eddington_luminosity(M::Quantity) = L_edd_Msun * M / Msun
const L_edd = eddington_luminosity

function Rsch(M)
    2 * G * M / c^2 |> upreferred
end

