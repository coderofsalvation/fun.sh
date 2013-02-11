#fbash.sh: Functional /bin/bash.
Functional bash scripting. Forked from https://github.com/mikeplus64/fun.sh

Functions:

lambda (var.., function)

The lambda function represents an anonymous function. The lambda function is used as a predicate for other functions.

eg.,

```bash
lambda a b : 'echo $(($a - $b))'
```

fold (function, list)

The fold function reduces a list (or other structure) to a single value by "folding" a binary operator (function) between successive elements of the list.

eg.,
```bash
list {1..3} | fold lambda a b : 'echo $(($a + $b))'
```bash
result:
```bash
6
```

list(var..)

The list function prints each element to a new line in order.

eg.,
```bash
list '1' '2' '3'
```
result:
```bash
1
2
3
```bash



rlist(var..)

The reverse list function prints each element to a new line in reverse order.

eg.,
```bash
rlist '1' '2' '3'
```
result:
```bash
3
2
1
```

strcmp(stringA, stringB)

The strcmp function compares two strings, returning 1 for a match and 0 for no match.

eg.,
```bash
strcmp 'hello' 'world'
```
result:
```bash
0
```
```bash
strcmp 'hello' hello'
```
result:
```bash
1
```


filter(function, list)

The filter function compares elements in a list using a given function, in ascending order. A new list is returned containing only list elements that satify the function.

eg.,
```bash
list 'hello' 'world' | filter lambda a : 'echo $(strcomp "$a" "hello")'
```
result:
```bash
hello
```

match(function, list)

The match function compares elements in a list using a given function, in ascending order. The first matching element is returned and if no match then nothing is returned.

eg.,
```bash
list 'hello' 'world' | match lambda a : 'echo $(strcomp "$a" "world")'
```
result:
```bash
world
```

position(function, list)

The position function compares elements in a list using a given function, in ascending order. The position of the first matching element is returned. Initial position is 0. Nothing is returned for no match.

eg.,
```bash
list 'hello' 'world' | position lambda a : 'echo $(strcomp "$a" "hello")'
```
result:
```bash
0
```
