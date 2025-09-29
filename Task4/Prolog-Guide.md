# Complete Prolog Commands and Operators Reference

## Table of Contents

1. [System Commands](#system-commands)
2. [File Management Commands](#file-management-commands)
3. [Directory Commands](#directory-commands)
4. [Debugging Commands](#debugging-commands)
5. [Query Control Commands](#query-control-commands)
6. [Information Commands](#information-commands)
7. [Unification Operators](#unification-operators)
8. [Arithmetic Operators](#arithmetic-operators)
9. [Mathematical Operators](#mathematical-operators)
10. [Logical Operators](#logical-operators)
11. [Comparison Operators](#comparison-operators)

---

# Prolog Commands

## System Commands

| Command | Function | Example | Description |
|---------|----------|---------|-------------|
| `halt.` | Exit Prolog | `?- halt.` | Terminates the Prolog session |
| `quit.` | Exit Prolog (alternative) | `?- quit.` | Same as halt |
| `bye.` | Exit Prolog (alternative) | `?- bye.` | Another way to exit |
| `help.` | Show help | `?- help.` | Display general help information |
| `help(Topic).` | Topic-specific help | `?- help(member).` | Help about specific predicate |
| `version.` | Show version | `?- version.` | Display Prolog version |

## File Management Commands

| Command | Function | Example | Description |
|---------|----------|---------|-------------|
| `[File].` | Load/consult file | `?- ['script.pl'].` | Load Prolog file |
| `consult(File).` | Load file | `?- consult('script.pl').` | Alternative way to load file |
| `reconsult(File).` | Reload file | `?- reconsult('script.pl').` | Reload file (replace old definitions) |
| `make.` | Reload modified files | `?- make.` | Recompile changed files |
| `listing.` | Show all predicates | `?- listing.` | Display all loaded predicates |
| `listing(Predicate).` | Show specific predicate | `?- listing(father).` | Show definition of father/2 |
| `edit(File).` | Edit file | `?- edit('script.pl').` | Open file in editor |
| `save(File).` | Save predicates | `?- save('backup.pl').` | Save current predicates to file |

## Directory Commands

| Command | Function | Example | Description |
|---------|----------|---------|-------------|
| `pwd.` | Print working directory | `?- pwd.` | Show current directory |
| `cd(Path).` | Change directory | `?- cd('/home/user').` | Change to specified directory |
| `ls.` | List directory contents | `?- ls.` | Show files in current directory |
| `exists_file(File).` | Check if file exists | `?- exists_file('test.pl').` | Returns true if file exists |
| `directory_files(Dir, Files).` | List files | `?- directory_files('.', F).` | Get list of files in directory |
| `expand_file_name(Pattern, Files).` | Find files by pattern | `?- expand_file_name('*.pl', F).` | Find all .pl files |
| `working_directory(Old, New).` | Change directory | `?- working_directory(_, '/tmp').` | Change and get old directory |

## Debugging Commands

| Command | Function | Example | Description |
|---------|----------|---------|-------------|
| `trace.` | Enable tracing | `?- trace.` | Turn on execution tracing |
| `notrace.` | Disable tracing | `?- notrace.` | Turn off execution tracing |
| `debug.` | Enable debugging | `?- debug.` | Enter debug mode |
| `nodebug.` | Disable debugging | `?- nodebug.` | Exit debug mode |
| `spy(Predicate).` | Set spy point | `?- spy(father).` | Monitor calls to father/2 |
| `nospy(Predicate).` | Remove spy point | `?- nospy(father).` | Stop monitoring father/2 |
| `nospyall.` | Remove all spy points | `?- nospyall.` | Clear all spy points |
| `debugging.` | Show debug status | `?- debugging.` | Display current debug settings |

## Query Control Commands

| Command | Function | Usage | Description |
|---------|----------|-------|-------------|
| `;` | More solutions | Press `;` after query | Find next solution |
| `Enter` | Stop searching | Press `Enter` after query | Stop looking for more solutions |
| `a` | Show all solutions | Press `a` after query | Display all remaining solutions |
| `Ctrl+C` | Interrupt execution | Press during execution | Stop current operation |
| `Ctrl+D` | EOF/Exit | Press at prompt | Exit Prolog (Unix/Linux) |
| `↑/↓` | Command history | Arrow keys | Navigate previous commands |

## Information Commands

| Command | Function | Example | Description |
|---------|----------|---------|-------------|
| `statistics.` | Show system statistics | `?- statistics.` | Display memory and time usage |
| `current_predicate(Name/Arity).` | List predicates | `?- current_predicate(X).` | Show all available predicates |
| `findall(X, Goal, List).` | Find all solutions | `?- findall(X, person(X), L).` | Collect all solutions in a list |
| `bagof(X, Goal, List).` | Collect solutions | `?- bagof(X, parent(X,Y), L).` | Collect solutions (may fail) |
| `setof(X, Goal, List).` | Sorted unique solutions | `?- setof(X, person(X), L).` | Sorted list without duplicates |
| `length(List, N).` | List length | `?- length([a,b,c], N).` | Get or check list length |
| `ground(Term).` | Check if ground | `?- ground(foo(a,b)).` | True if no variables |

---

# Prolog Operators

## Unification Operators

| Operator | Meaning | Example | Result | Description |
|----------|---------|---------|--------|-------------|
| `=` | Unification | `X = 5` | X = 5 | X becomes unified with 5 |
| `\=` | Not unifiable | `john \= mary` | true | True if terms cannot unify |
| `==` | Identical | `5 == 5` | true | True if terms are identical |
| `\==` | Not identical | `5 \== 3` | true | True if terms are not identical |

## Arithmetic Operators

| Operator | Meaning | Example | Result | Description |
|----------|---------|---------|--------|-------------|
| `=:=` | Arithmetic equality | `2+3 =:= 5` | true | Evaluates and compares numbers |
| `=\=` | Arithmetic inequality | `2+3 =\= 6` | true | Evaluates and checks inequality |
| `<` | Less than | `3 < 5` | true | Arithmetic less than |
| `>` | Greater than | `5 > 3` | true | Arithmetic greater than |
| `=<` | Less or equal | `3 =< 5` | true | Arithmetic less than or equal |
| `>=` | Greater or equal | `5 >= 3` | true | Arithmetic greater than or equal |
| `is` | Arithmetic evaluation | `X is 3 + 2` | X = 5 | Evaluates expression and unifies |

## Mathematical Operators

| Operator | Operation | Example | Result | Description |
|----------|-----------|---------|--------|-------------|
| `+` | Addition | `X is 3 + 2` | X = 5 | Addition |
| `-` | Subtraction | `X is 5 - 2` | X = 3 | Subtraction |
| `*` | Multiplication | `X is 3 * 4` | X = 12 | Multiplication |
| `/` | Division | `X is 10 / 2` | X = 5.0 | Real division |
| `//` | Integer division | `X is 10 // 3` | X = 3 | Integer division |
| `mod` | Modulo | `X is 7 mod 3` | X = 1 | Remainder after division |
| `rem` | Remainder | `X is 7 rem 3` | X = 1 | Remainder (similar to mod) |
| `**` | Power | `X is 2 ** 3` | X = 8 | Exponentiation |
| `^` | Power (alternative) | `X is 2 ^ 3` | X = 8 | Alternative power operator |
| `abs` | Absolute value | `X is abs(-5)` | X = 5 | Absolute value |
| `max` | Maximum | `X is max(3,7)` | X = 7 | Maximum of two values |
| `min` | Minimum | `X is min(3,7)` | X = 3 | Minimum of two values |

## Logical Operators

| Operator | Meaning | Example | Description |
|----------|---------|---------|-------------|
| `\+` | Negation (NOT) | `\+ is_even(3)` | True if goal cannot be proven |
| `,` | Conjunction (AND) | `male(X), parent(X,Y)` | Both goals must succeed |
| `;` | Disjunction (OR) | `(male(X); female(X))` | At least one goal must succeed |
| `->` | If-then | `(X > 0 -> Y = pos; Y = neg)` | Conditional execution |
| `*->` | Soft cut if-then | `(X > 0 *-> Y = pos; Y = neg)` | Conditional with soft cut |

## Comparison Operators

| Operator | Meaning | Example | Use Case |
|----------|---------|---------|----------|
| `@<` | Term less than | `abc @< def` | Lexicographic comparison |
| `@>` | Term greater than | `def @> abc` | Lexicographic comparison |
| `@=<` | Term less or equal | `abc @=< abc` | Lexicographic comparison |
| `@>=` | Term greater or equal | `def @>= abc` | Lexicographic comparison |
| `compare(Order, X, Y)` | Compare terms | `compare(>, 5, 3)` | Returns <, =, or > |

## List Operators

| Operator | Meaning | Example | Description |
|----------|---------|---------|-------------|
| `[H\|T]` | List constructor | `[1\|[2,3]]` | Head and tail notation |
| `append` | List concatenation | `append([1,2], [3,4], X)` | Join lists |
| `member` | List membership | `member(2, [1,2,3])` | Check if element in list |
| `length` | List length | `length([1,2,3], N)` | Get list length |

## String/Atom Operators

| Operator | Meaning | Example | Description |
|----------|---------|---------|-------------|
| `atom_codes(Atom, Codes)` | Atom to codes | `atom_codes(hello, X)` | Convert atom to ASCII codes |
| `atom_chars(Atom, Chars)` | Atom to chars | `atom_chars(hello, X)` | Convert atom to character list |
| `atom_concat(A1, A2, A3)` | Concatenate atoms | `atom_concat(hello, world, X)` | Join atoms |

---
