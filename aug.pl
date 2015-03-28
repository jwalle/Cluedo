solve :-
    solve(_).

solve(S) :-

    S = [[C1,N1,P1,D1,S1],
         [C2,N2,P2,D2,S2],
         [C3,N3,P3,D3,S3],
         [C4,N4,P4,D4,S4],
         [C5,N5,P5,D5,S5]],

    member([red, 'English man', _, _, _], S),
    member([_, 'Swede', dog, _, _], S),
    member([_, 'Dane', _, tea, _], S),
    left_of([green |_], [white |_], S),
    member([green, _, _, coffee, _], S),
    member([_, _, birds, _, pall_mall], S),
    member([yellow, _, _, _, dunhill], S),
    D3 = milk,
    N1 = 'Norwegian',
    next_to([_, _, _, _, blend], [_, _, cats |_], S),
    next_to([_, _, _, _, dunhill], [_, _, horse |_], S),
    member([_, _, _, beer, blue_master], S),
    member([_, 'German', _, _, prince], S),
    next_to([_, 'Norwegian' |_], [blue |_], S),
    next_to([_, _, _, water,_], [_, _, _, _, blend], S),


    member([_, Who, zebra, _, _], S),
    write('The '), write(Who), write(' owns the zebra.\n').

left_of(L1, L2, [L1, L2 |_]).
left_of(L1, L2, [_| Rest ]) :-
    left_of(L1, L2, Rest).
    
next_to(L1, L2, S) :-
    left_of(L1, L2, S).
next_to(L1, L2, S) :-
    left_of(L2, L1, S).