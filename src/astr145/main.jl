using Unitful, UnitfulAstro
using Unitful: mp, G, c
using UnitfulAstro: Msun

σT = 6.65e-25u"cm^2" # Thomson cross section

"""
    eddington_luminosity(M, kappa = σT/mp)

Calculate the Eddington luminosity for a given mass ``L = 4 * pi * G * M * c / \\kappa``
"""
function eddington_luminosity(M, kappa = σT/mp)
    L = 4 * pi * G * M * c / kappa
    uconvert(u"erg/s", L)
end