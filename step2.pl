resoudre :-
	resoudre(_).


resoudre(S) :-

	S =  [[B1,T1,A1,N1,C1],
		  [B2,T2,A2,N2,C2],
	 	  [B3,T3,A3,N3,C3],
	 	  [B4,T4,A4,N4,C4],
		  [B5,T5,A5,N5,C5]],

member([_, _, _, 'anglais', rouge], S),
member([_, _, chiens, 'suedois', _], S),
member([the, _, _, 'danois', _], S),
member([cafe, _, _, _, verte], S),
member([_, pall_mall, oiseaux, _, _], S),
member([_, dunhill, _, _, jaune], S),
N1 = 'norvegien',
B3 = lait,
member([biere, blue_master, _, _, _],S),
member([ _, prince, 'allemand', _, _],S),
gauche([_, _, _, _, verte], [_,_,_,_,blanche], S),


a_cote([_, _, _, _, bleue], [_, _, _, 'norvegien', _], S),
a_cote([_, blend, _, _, _], [_, _, chat, _, _], S),
a_cote([_, blend, _, _, _], [eau, _, _, _, _], S),
a_cote([_, _, cheval, _, _], [_, dunhill, _, _, _], S),


% Each house has its own unique color.
    C1 \== C2, C1 \== C3, C1 \== C4, C1 \== C5,
    C2 \== C3, C2 \== C4, C2 \== C5,
    C3 \== C4, C3 \== C5, C4 \== C5,
% All house owners are of different nationalities.
    N1 \== N2, N1 \== N3, N1 \== N4, N1 \== N5,
    N2 \== N3, N2 \== N4, N2 \== N5,
    N3 \== N4, N3 \== N5, N4 \== N5,
% They all have different pets.
    P1 \== P2, P1 \== P3, P1 \== P4, P1 \== P5,
    P2 \== P3, P2 \== P4, P2 \== P5,
    P3 \== P4, P3 \== P5, P4 \== P5,
% They all drink different drinks.
    D1 \== D2, D1 \== D3, D1 \== D4, D1 \== D5,
    D2 \== D3, D2 \== D4, D2 \== D5,
    D3 \== D4, D3 \== D5, D4 \== D5,
% They all smoke different cigarettes.
    S1 \== S2, S1 \== S3, S1 \== S4, S1 \== S5,
    S2 \== S3, S2 \== S4, S2 \== S5,
    S3 \== S4, S3 \== S5, S4 \== S5,



member([_, Who, poisson, _, _], S),
write('LE '), write(Who), write(' possede le poisson.\n').

gauche(L1, L2, [L1, L2 |_]).
gauche(L1, L2, [_| Rest]) :-
	gauche(L1, L2, Rest).


a_cote(L1, L2, S) :- gauche(L1, L2, S).
a_cote(L1, L2, S) :- gauche(L2, L1, S).

%poisson(X) :-

%maisons(ms), member(m, (_, _, poisson, X, _), ms)	% on cherche la nationalite de la personne qui a un poisson