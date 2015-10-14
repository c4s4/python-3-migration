#!/usr/bin/env python
# encoding: UTF-8

import sys
import math

# slide 4
print "Hello World!"

print "pas de retour à la ligne",
print >>sys.stderr, "erreur"
print ("spam", "eggs")

# slide 6
print map(math.factorial, range(6))
print filter(lambda x: x % 2 == 0, range(6))

# slide 11
try:
    e = Exception("exception")
    e.__cause__ = Exception("cause")
    raise e
except Exception, e:
    print(e, "from", e.__cause__)
