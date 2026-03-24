# Evidence 1: Lexical Analisis
Ana Valeria Machuca Miranda- A01713851
## Language Description
Quenya stands as one of the most prominent constructed languages within J.R.R. Tolkien’s The Lord of the Rings saga, serving as an ancient tongue and the progenitor of several other languages spoken throughout Middle-earth (Forgotten Realms Fandom). Primarily spoken by the non-Telerin Elves who reached the Undying Lands of Valinor, Quenya descended from Ancient Quenya, which itself evolved from Common Eldarin (Tolkien Gateway). While the language was shared by the Elven houses, it branched into two mutually intelligible dialects: Vanyarin Quenya, which remained closest to the archaic forms, and Ñoldorin Quenya, spoken by the House of Ñoldor (LOTR Fandom). To record this "High-Elven" tongue, speakers typically utilized the Tengwar script, also famously referred to as the Fëanorian characters (Tolkien Gateway; LOTR Fandom).

I will proceed to model only these follwoing 5 words:
-Ainu - Quenya Tengwar word meaning 'Holy One'. The plural is Ainur, and refers to the primordial spirits created by Ilúvatar.

-Aiglos - Sindarin for 'Icicle', also name of Gil-galad's spear

-Alda - Quenya word for 'Tree'.

-Aldalómë - Combination of Quenya words meaning 'tree-shadow' used by Treebeard the Ent.

-Alqua - Sindarin word for 'Swan'.


## RegEx
According to the book Mastering Regular Expressions by Jeffrey E. F. Friedl, the principal definition of a RegEx is:
"A regular expression is a way to describe a pattern of characters. It is a specialized language used to provide a precise description of a text pattern to a search engine, allowing it to find or manipulate strings that match that specific structure rather than just searching for fixed, literal text."

The RegEx constructed for repsective words is this one:
*A (i(nu|glos)|(l(da|dalómë|qua)*

### Automaton Theory:

Accodring to  a Deterministic Finite Automaton (DFA) is a quintuple $(Q, \Sigma, \delta, s, F)$, where $Q$ is the finite set of states, $\Sigma$ is the input alphabet, $s \in Q$ is the starting state, and $F \subseteq Q$ is the set of final states. The defining characteristic of a DFA is its transition function $\delta: Q \times \Sigma \rightarrow Q$, which maps each pair of state and input symbol to exactly one state. In contrast, a Nondeterministic Finite Automaton (NFA) is also defined as a quintuple $(Q, \Sigma, \delta, s, F)$ with the same components, but its transition function $\delta: Q \times \Sigma \rightarrow 2^Q$ maps to the power set of $Q$, meaning it can transition to a set of multiple states or none at all for a single input.The primary difference between the two lies in the nature of their transitions: while a DFA provides a single, deterministic path for a given input, an NFA allows for multiple concurrent paths.

## Automata
Taking all of this into account, I chose to implement a DFA because my main goal is to exclusively recognize these five words and reject everything else. Each word follows a unique and well-defined path through the automaton, making an NFA unnecessary. Furthermore, NFAs can introduce ambiguity, which would complicate the implementation process. A DFA, on the other hand, is generally more straightforward to implement and fits perfectly with the language and specific case being analyzed, which is why it was the preferred choice.

In this chosen range of words, the vocabulary is limited by this alphabet. Only the letters presented will be taken into account, not any other character out of those.
*∑=A,i,n,u,g,l,o,s,q,a,d,m,e*

Here is the design proposal:
<img width="1531" height="860" alt="automata elvish (2)" src="https://github.com/user-attachments/assets/93093cdb-f8a2-4c99-978c-d423fa575b80" />

## Implementation

````prolog
transition(CurrentState, NextState, Letter)
````
My accepted states are two and are these ones:

````prolog
accepting_state(q8a).
accepting_state(z).
````

This is the entry point of the strings
````prolog
check_word(LetterList) :-
    traverse(LetterList, q0).
````
Base case of recursion: when there are no letters left, check if the current state is an accepting state. If it is, the word is valid. If it isn't, the word is rejected.
````prolog
traverse([], CurrentState) :-
    accepting_state(CurrentState).
````
Recursive case: take the first letter off the list, look up if there is a valid transition from the current state using that letter, and if there is, call itself again with the remaining letters and the new state. If no transition exists for that letter, it fails immediately and the word is rejected.

```prolog
traverse([Letter | Rest], CurrentState) :-
    transition(CurrentState, NextState, Letter),
    traverse(Rest, NextState).
````

These rules will be fed by the knowledge base of the transitions. All of this can be found in Autimplementation.pl file.

## Test Cases


## Spatial and Temporal Complexity
DFA, complexity is O(n^2)

## References

