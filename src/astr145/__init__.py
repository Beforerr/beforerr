from astropy.constants import c, G, M_sun
from math import pi

def schwarzschild_radius(M):
    """Schwarzschild radius"""
    return (2 * G * M) / (c ** 2)