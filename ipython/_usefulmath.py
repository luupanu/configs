from math import gcd, sqrt
from random import randint, sample
from typing import Sequence
import numpy as np

"""
Returns common factors of two numbers a and b.
"""
def common_factors(a: int, b: int) -> [int]:
    L = []
    g = gcd(a, b)
    for i in range(1, int(sqrt(g)) + 1): 
        if g % i == 0:
            L.append(i)
            if g != i*i:
                L.append(int(g/i))
    return sorted(L)

def constrained_function(inputs: Sequence[float], outputs: Sequence[float]) -> Sequence[float]:
    """
    Returns a tuple of (a, c)
    where given any function f with input range (f_min, f_max)
    is constrained to output range (g_min, g_max) so that:
      g_min <= a*f+c <= g_max

    :param inputs: (f_min, f_max) input range, must contain exactly two values
    :param outputs: (g_min, g_max) output range, must contain exactly two values
    :returns: a tuple (a, c) where g_min <= a*f+c <= g_max
    """
    return tuple(np.linalg.solve(np.array([[inputs[0], 1], [inputs[1], 1]]), np.array([outputs[0], outputs[1]])))

def ceildiv(a: float, b: int) -> int:
    """
    Just like the // operator, just returning ceil()
    instead of floor().

    :param a: dividend
    :param b: divider
    :returns: an integer
    """
    return int(-(-a // b))

def split_number_evenly(x: int, n: int) -> Sequence[int]:
    """
    Split a number x evenly into an array a containing n chunks,
    where sum(a) = x.

    :param x: number to be split
    :param n: number of chunks (array length)
    :returns: a randomly sorted array
    """
    return sample([ceildiv(x, n)] * (x % n) + [x // n] * (n - x % n), n)

def sample_uniform_sums_to_n(a: int, n: int, k: int) -> Sequence[int]:
    """
    Draw k numbers between [a, n] from uniform distribution where sum of
    the numbers equals n.

    :param a: lower limit for each number (inclusive)
    :param n: upper limit for each number (inclusive)
    :param k: how many numbers to generate
    :returns: an array
    """
    arr = [a, n]
    for _ in range(k-1):
        arr.append(randint(a, n))
    arr = sorted(arr)
    return np.diff(arr)

def sample_uniform_sums_to_n_upper_limit(a: int, b: int, n: int, k: int) -> Sequence[int]:
    """
    Draw k numbers between [a, b] from uniform distribution where sum of
    the numbers equals n.

    !!!! Brute-force approach, probably very slow when n approaches b*k.

    :param a: lower limit for each number (inclusive)
    :param b: upper limit for each number (inclusive)
    :param n: generated numbers sum to n
    :param k: how many numbers to generate
    :returns: an array
    """
    if k*b < n:
        raise ValueError(f'b={b}*k={k} cannot be less than n={n}!')

    while True:
        arr = [a, n]
        for _ in range(k-1):
            arr.append(randint(a, n))
        arr = np.diff(sorted(arr))
        if np.max(arr) <= b:
            return arr

# https://stackoverflow.com/a/62729110
def factors(n):
    """
    Factors of n based upon getting primes for trial division based upon wheel factorization

    :param n: a number
    :returns: all factors of number n
    """

    # Init to 1 and number
    result = {1, n}

    # set up prime generator
    primes = prime_generator()

    # Get next prime
    i = next(primes)

    while(i * i <= n):
        if (n % i == 0):
            result.add(i)

            while (n % i == 0):
                n //= i
                result.add(n)

        i = next(primes)  # use next prime

    return result

def prime_generator():
    """
    Generator for primes using trial division and wheel method
    """
    yield 2; yield 3; yield 5; yield 7;

    def next_seq(r):
        " next in the sequence of primes "
        f = next(r)
        yield f

        r = (n for n in r if n % f)  # Trial division
        yield from next_seq(r)

    def wheel():
        " cycles through numbers in wheel whl "
        whl = [2, 4, 2, 4, 6, 2, 6, 4, 2, 4, 6, 6, 2, 6, 4, 2,
               6, 4, 6, 8, 4, 2, 4, 2, 4, 8, 6, 4, 6, 2, 4, 6,
               2, 6, 6, 4, 2, 4, 6, 2, 6, 4, 2, 4, 2, 10, 2, 10]

        while whl:
            for element in whl:
                yield element

    def wheel_accumulate(n, gen):
        " accumulate wheel numbers "
        yield n

        total = n
        for element in gen:
            total += element
            yield total

        for p in next_seq(wheel_accumulate(11, wheel())):
            yield p

# def gcd(a: int, b: int) -> int:
#     """
#     Recursively calculate the greatest common divisor.

#     :param a: an integer
#     :param b: an integer
#     :returns: the greatest common divisor
#     """
#     if b == 0:
#         return a
#     return gcd(b, a % b)
