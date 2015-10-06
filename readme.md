Faut-il passer à Python 3 ?
===========================

Michel Casabianca

BDX.io 2015

---
Les nouveautés de Python 3
--------------------------

Python 3 (ou Python 3000 ou encore Py3k) est une refonte de Python, incompatible avec les versions 2, qui a commencé le 5 avril 2006 (avec le PEP 3000) et qui a abouti à la release de Python 3.0.0 le 3 décembre 2008.

Depuis, nombre de fonctionnalités ont été backportées vers les versions 2 (accessible avec les imports `from __future__`.

Un document liste les changements de Python 3 :

<https://docs.python.org/3.5/whatsnew/3.0.html>

---
La fonction print
-----------------

Print n'est plus une déclaration mais une fonction :

```python
# avant
print "Hello World!"
# après
print("Hello World!")
```

Les formes les plus bizarres ont été rationalisées :

```python
# avant
print x,
print >>sys.stderr, "error"
print (x, y)
# après
print(x, end=" ")
print("error", file=sys.stderr)
print((x, y))
```

On peut utiliser ces nouvelles formes en Python 2 avec l'import `from __future__ import print_function`, mais on ne peut plus utiliser les formes autorisées en Python 2.

---
Vues et itérateurs au lieu de listes
------------------------------------

En Python 2, `dict.keys()`, `dict.values()` et `dict.items()` renvoient une liste. Cette liste est valide au moment de l'appel et si le dictionnaire est modifié, la liste ne l'est pas. D'autre part, cette liste modifiable.

En Python 3, ces appels renvoient des vues (*views* en anglais). Ces vues reflètent l'état du dictionnaire, même après modification. D'autre part, ces vues ne sont pas modifiables.

On peut voir la différence entre listes et vues de la manière suivante :

![](img/list-vs-view.png)

---
Fonctions map, filter et zip
----------------------------

Les fonctions `map()`, `filter()` et `zip()` renvoient aussi des vues. Pour les deux premières, il faut les remplacer par des list comprehensions :

```python
import math
# avant
print map(math.factorial, range(6))
print filter(lambda x: x % 2 == 0, range(6))
# après
print([math.factorial(x) for x in range(6)])
print([x for x in range(6) if x % 2 == 0])
```

Ces formes avec list comprehensions sont bien plus claires et tout aussi rapides que les versions avec fonctions.

---
Chaînes de caractères
---------------------

En Python 2, les chaînes de caractères sont de deux types : unicode et 8-bits. On peut mixer les deux, mais cela conduit souvent à des erreurs de type `UnicodeDecodeError`.

En Python 3, le type qui contient du texte est `str` et celui qui contient de la donnée est `bytes`. On ne peut mixer les deux, sans quoi on lève une `TypeError`.

On peut préparer la migration en n'utilisant en Python 2 que des chaînes unicode pour contenir du texte et effectuer explicitement les conversions avec un encoding explicite. Alors l'outil *2to3* pourra effectuer la majeure partie du travail pour vous.

Il y aurait beaucoup à dire sur le sujet des chaînes de catactères et des données binaires, pour plus de détails sur ce sujet, voir le Unicode Howto : <https://docs.python.org/3.5/howto/unicode.html>.

---
Autres changements
------------------

- Ordre des comparaisons.
- Nombres entiers.

---
Outils de migration
-------------------

2to3

six

Python 3 warning mode : démarrer Python avec l'option `-3`, indique alors les incompatibilités qui ne peuvent être gérées par *2to3*.

---
Procédure de migration
----------------------

0- S'assurer, avant la migration, que l'on a une bonne couverture de tests.
1- Activer les warnings Python 3
2- Tester et éditer jusqu'à ce qu'il ne reste plus de warning.
3- Utiliser l'outil 2to3 pour convertir le source vers Python 3. Ne pas éditer les sources résultants à la main !
4- Tester le code avec Python 3.
5- Si des problèmes persistent, corriger le source Python 2 et reprendre à partir de l'étape 2.
6- On releasera deux versions : une Python 2 et une Python 3.

Il est conseillé de ne pas éditer le code Python 3 avant de ne plus assurer le support de la version Python 2.

---
Les chiffres sur la migration
-----------------------------

<http://astrofrog.github.io/blog/2015/05/09/2015-survey-results/>

