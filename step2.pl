resoudre :-
	resoudre(_).

resoudre(S) :-

	S =  [[C1,N1,P1,D1,S1],
         [C2,N2,P2,D2,S2],
         [C3,N3,P3,D3,S3],
         [C4,N4,P4,D4,S4],
         [C5,N5,P5,D5,S5]],

    member([rouge, 'Anglais', _, _, _], S),
    member([_, 'Suedois', chien, _, _], S),
    member([_, 'Danois', _, the, _], S),
    left_of([vert |_], [blanche |_], S),
    member([vert, _, _, cafe, _], S),
    member([_, _, oiseaux, _, pall_mall], S),
    member([jaune, _, _, _, dunhill], S),
    D3 = lait,
    N1 = 'Norvegien',
    next_to([_, _, _, _, blend], [_, _, chats |_], S),
    next_to([_, _, _, _, dunhill], [_, _, cheval |_], S),
    member([_, _, _, biere, blue_master], S),
    member([_, 'allemand', _, _, prince], S),
    next_to([_, 'Norvegien' |_], [bleu |_], S),
    next_to([_, _, _, eau,_], [_, _, _, _, blend], S),

    
    C1 \== C2, C1 \== C3, C1 \== C4, C1 \== C5,
    C2 \== C3, C2 \== C4, C2 \== C5,
    C3 \== C4, C3 \== C5, C4 \== C5,
    N1 \== N2, N1 \== N3, N1 \== N4, N1 \== N5,
    N2 \== N3, N2 \== N4, N2 \== N5,
    N3 \== N4, N3 \== N5, N4 \== N5,
    P1 \== P2, P1 \== P3, P1 \== P4, P1 \== P5,
    P2 \== P3, P2 \== P4, P2 \== P5,
    P3 \== P4, P3 \== P5, P4 \== P5,
    D1 \== D2, D1 \== D3, D1 \== D4, D1 \== D5,
    D2 \== D3, D2 \== D4, D2 \== D5,
    D3 \== D4, D3 \== D5, D4 \== D5,
    S1 \== S2, S1 \== S3, S1 \== S4, S1 \== S5,
    S2 \== S3, S2 \== S4, S2 \== S5,
    S3 \== S4, S3 \== S5, S4 \== S5,


	member([_, Who, poisson, _, _], S),
	write('L '), write(Who), write(' possede le poisson.\n').


left_of(L1, L2, [L1, L2 |_]).
left_of(L1, L2, [_| Rest ]) :-
    left_of(L1, L2, Rest).
    
next_to(L1, L2, S) :-
    left_of(L1, L2, S).
next_to(L1, L2, S) :-
    left_of(L2, L1, S).