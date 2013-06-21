#fbash.sh: Functional /bin/bash.
Functional bash scripting. Forked from https://github.com/mikeplus64/fun.sh

<h2>Functions:</h2>

<h3>lambda (var.., function)</h3>

The lambda function represents an anonymous function. The lambda function is used as a predicate for other functions.

eg.,

```bash
lambda a b : 'echo $(($a - $b))'
```

<h3>fold (function, list)</h3>

The fold function reduces a list (or other structure) to a single value by "folding" a binary operator (function) between successive elements of the list.

eg.,
```bash
list {1..3} | fold lambda a b : 'echo $(($a + $b))'
```
result:
```bash
6
```

<h3>list(var..)</h3>

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
```

<h3>rlist(var..)</h3>

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

<h3>strcmp(stringA, stringB)</h3>

The strcmp function compares two strings, returning 1 for a match and 0 for no match.

eg.,
```bash
strcmp 'hello' 'world'
```
result:
```bash
0
```
eg.,
```bash
strcmp 'hello' 'hello'
```
result:
```bash
1
```


<h3>filter(function, list)</h3>

The filter function compares elements in a list using a given function, in ascending order. A new list is returned containing only list elements that satify the function.

eg.,
```bash
list 'hello' 'world' | filter lambda a : 'echo $(strcomp "$a" "hello")'
```
result:
```bash
hello
```

<h3>match(function, list)</h3>

The match function compares elements in a list using a given function, in ascending order. The first matching element is returned and if no match then nothing is returned.

eg.,
```bash
list 'hello' 'world' | match lambda a : 'echo $(strcomp "$a" "world")'
```
result:
```bash
world
```

<h3>position(function, list)</h3>

The position function compares elements in a list using a given function, in ascending order. The position of the first matching element is returned. Initial position is 0. Nothing is returned for no match.

eg.,
```bash
list 'hello' 'world' | position lambda a : 'echo $(strcomp "$a" "hello")'
```
result:
```bash
0
```

<h3>partial(result_function, function, args...)</h3>

Partially apply `function` to `args`, store the resulting function in `result_function`.

```bash
add() {
    expr $1 + $2
}
partial adder3 add 3
adder3 6
```
result:
```bash
9
```