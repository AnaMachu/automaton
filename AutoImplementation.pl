% Knowledge base of the transitions in the DFA
% transition(CurrentState, NextState, Letter)


transition(q0, q1, 'A').
transition(q1, q2, i).
transition(q2, q3, n).
transition(q3, z,  u).
transition(q2, q4, g).
transition(q4, q5, l).
transition(q5, q6, o).
transition(q6, z, 's').
transition(q1,  q7,  l).
transition(q7,  q8,  d).
transition(q8,  q8a, a).   
transition(q8a, q9,  l).
transition(q9,  q10, o).
transition(q10, q11, 'm').
transition(q11, z, 'e').
transition(q7,  q13, 'q').
transition(q13, q14, u).
transition(q14, z,   a).


accepting_state(q8a).
accepting_state(z).


% Entry point: always starts from q0
check_word(LetterList) :-
    traverse(LetterList, q0).

% Base case: empty list, check if current state is accepting
traverse([], CurrentState) :-
    accepting_state(CurrentState).

% Recursive case: read letter, move to next state, continue
traverse([Letter | Rest], CurrentState) :-
    transition(CurrentState, NextState, Letter),
    traverse(Rest, NextState).


test_ainu :-
    write('Ainu'), nl,
    write('Expected: true'), nl,
    ( check_word(['A', i, n, u]) -> write('Result: true') ; write('Result: false') ), nl, nl.

test_aiglos :-
    write('Aiglos'), nl,
    write('Expected: true'), nl,
    (check_word(['A', i, g, l, o, 's']) -> write('Result: true') ; write('Result: false') ), nl, nl.

test_alda :-
    write('Alda'), nl,
    write('Expected: true'), nl,
    ( check_word(['A', l, d, a]) -> write('Result: true') ; write('Result: false') ), nl, nl.

test_aldalome :-
    write('Aldalome'), nl,
    write('Expected: true'), nl,
    ( check_word(['A', l, d, a, l, o, 'm', e]) -> write('Result: true') ; write('Result: false') ), nl, nl.

test_alqua :-
    write('Alqua'), nl,
    write('Expected: true'), nl,
    ( check_word(['A', l, q, u, a]) -> write('Result: true') ; write('Result: false') ), nl, nl.

%These words are not supposed to be valid
test_invalid_algo :-
    write('Algo (invalid)'), nl,
    write('Expected: false'), nl,
    ( check_word(['A', l, g, o]) -> write('Result: true') ; write('Result: false') ), nl, nl.

test_invalid_aldaloma :-
    write('Aldaloma (invalid)'), nl,
    write('Expected: false'), nl,
    ( check_word(['A', l, d, a, l, o, 'm', a]) -> write('Result: true') ; write('Result: false') ), nl, nl.

%  Run all tests at the same time
run_all_tests :-
    write('Running all tests'), nl, nl,
    test_ainu,
    test_aiglos,
    test_alda,
    test_aldalome,
    test_alqua,
    test_invalid_algo,
    test_invalid_aldaloma.
