# Sigils Overview
Elixir provides an alternative syntax for representing and working with literals.
A sigil will start with a tilde ~ followed by a character.
The Elixir core provides us with some built in sigils however,
it is possible to create our own when we need to extend the language.

## A list of available sigils include:
* ~C Generates a character list with no escaping or interpolation
* ~c Generates a character list with escaping and interpolation
* ~R Generates a regular expression with no escaping or interpolation
* ~r Generates a regular expression with escaping and interpolation
* ~S Generates a string with no escaping or interpolation
* ~s Generates a string with escaping and interpolation
* ~W Generates a word list with no escaping or interpolation
* ~w Generates a word list with escaping and interpolation
* ~N Generates a NaiveDateTime struct

## A list of delimiters include:
* <...> A pair of pointy brackets
* {...} A pair of curly brackets
* [...] A pair of square brackets
* (...) A pair of parenthesis
* |...| A pair of pipes
* /.../ A pair of forward slashes
* "..." A pair of double quotes
* '...' A pair of single quotes

