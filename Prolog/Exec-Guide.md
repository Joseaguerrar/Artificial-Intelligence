# Complete Prolog Execution Guide

## Step 1: Install Prolog (Ubuntu/Debian)

**Install SWI-Prolog:**

```bash
sudo apt update
sudo apt install swi-prolog
```

**Verify installation:**

```bash
swipl --version
```

## Step 2: Navigation Commands for File Location

**Check where you are:**

```bash
pwd
# Shows your current directory path
```

**Look for Prolog files specifically:**

```bash
ls *.pl
# Shows only files ending in .pl (Prolog files)

find . -name "*.pl"
# Finds all .pl files in current directory and subdirectories
```

## Step 3: Create Basic Example File

```prolog
% Basic Prolog Example - Family Tree
person(john).
person(mary).
person(bob).
parent(john, bob).
parent(mary, bob).
male(john).
female(mary).

% Rules
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
```

## Step 4: Loading Files - 4 Different Options

### Option 1: Use Full Path (Recommended for Beginners)

You can be anywhere and load any file:

```bash
# You can be in any directory
cd /home/joseaguerrar
swipl
```

```prolog
?- pwd.  % Check where Prolog thinks it is
?- ['/home/joseaguerrar/Artificial-Intelligence/basic_example.pl'].
% This always works regardless of where you are
```

### Option 2: Start in the File's Directory

```bash
# Navigate to where the file is located
cd /home/joseaguerrar/Artificial-Intelligence
pwd  # Confirm you're in the right place
ls *.pl  # See available Prolog files
swipl
```

```prolog
?- pwd.  % Confirm Prolog location
?- ['basic_example.pl'].  % Simple filename works
```

### Option 3: Start in Parent Directory, Use Relative Path

```bash
# Navigate to parent directory
cd /home/joseaguerrar/Artificial-Intelligence
swipl
```

```prolog
?- pwd.  % Shows /home/joseaguerrar/Artificial-Intelligence
?- ['Task4/Script.pl'].  % Load from subdirectory
```

### Option 4: Change Directory Inside Prolog

```bash
# Start anywhere
swipl
```

```prolog
?- pwd.  % See where you are
?- cd('/home/joseaguerrar/Artificial-Intelligence').  % Change location in Prolog
?- pwd.  % Confirm new location
?- ['basic_example.pl'].  % Now simple filename works
```

## Step 5: Useful Prolog Navigation Commands

**Check current directory in Prolog:**

```prolog
?- pwd.
% Shows where Prolog thinks it is
```

**List files in current Prolog directory:**

```prolog
?- directory_files('.', Files).
% Lists all files - useful to see what's available
```

**Look for Prolog files:**

```prolog
?- expand_file_name('*.pl', Files).
% Shows all .pl files in current directory
```

**Check if a specific file exists:**

```prolog
?- exists_file('basic_example.pl').
% Returns true if file exists, false if not
```

## Step 6: Test Your Loaded File

Once file is loaded successfully (you see `true.`), test with queries/commands like in the Prolog-Guide attached file:

```prolog
?- person(X).
% Press ; for more answers, Enter to stop

?- parent(john, X).
% Who are john's children?

?- father(X, bob).
% Who is bob's father?

?- mother(X, bob).
% Who is bob's mother?
```
