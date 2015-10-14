#!/usr/bin/env python

import sys
import math

# slide 4
print("Hello World!")

print("pas de retour à la ligne", end=" ")
print("erreur", file=sys.stderr)
print(("spam", "eggs"))

# slide 6
print([math.factorial(x) for x in range(6)])
print([x for x in range(6) if x % 2 == 0])

# slide 9
def repeat(s: str, n: int) -> str:
    return n*s
print(repeat("spam ", 10))

def func(*, foo, bar):
    print(foo, bar)
try:
    func(1, 2)
except TypeError as e:
    assert(str(e) == "func() takes 0 positional arguments but 2 were given")

# slide 10
x, y, *reste = range(5)
print(reste)

print({65+c: chr(65+c) for c in range(26)})

s = {1, 2, 2, 3, 3}
print(s)

# slide 11
try:
    raise Exception("exception") from Exception("cause")
except Exception as e:
    print(e, "from", e.__cause__)
