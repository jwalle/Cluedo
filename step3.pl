 initial_state([n,n,n,n]).  % each entity is on the north side.
    final_state([s,s,s,s ]).  % each is on the south side.

    next_state(S,S1) :- move(S,S1), safe(S1).  % move from S to S1 if S1 is safe

    %Mouvement possible :


    go :- write('La solution est :'),nl, depth_first_search(_),nl.


    move([F,W,G,C], [F1,W,G,C]) :- cross(F,F1).  % farmer crosses alone
    move([F,F,G,C], [F1,F1,G,C]) :- cross(F,F1). % farmer and wolf cross
    move([F,W,F,C], [F1,W,F1,C]) :- cross(F,F1). % farmer and goat cross
    move([F,W,G,F], [F1,W,G,F1]) :- cross(F,F1). % farmer and cabbage cross

    safe([F,_,G,_]) :- F = G, !.
    safe([F,W,_,C]) :- F = W, F = C.  
        % Safe if either Farmer and Goat are together or
        % Farmer is with Wolf and Cabbage

    cross(n,s).
    cross(s,n).

    depth_first_search(AnsPath) :-
    initial_state(Init),
    depth_first([Init], AnsPath).

    depth_first([S|_], [S]) :-
    final_state(S), !.
    depth_first([S|Path], [S|AnsPath]) :-
write('Extending '),write([S|Path]),nl,
    extend([S|Path], S1),
write('Next path: '), write(S1), nl,  
    depth_first([S1,S|Path], AnsPath).

    extend([S|Path], S1) :-
    next_state(S,S1),
    not(member_state(S1, [S|Path])).

    member_state(S, [S|_]).
    member_state(X, [_|T]) :- member_state(X,T).

% If you want to collect all the answer paths:
    go(AllPaths) :-
    bagof(AnsPath, depth_first_search(AnsPath), AllPaths).

% swish
% 
% https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_17.html
% 
% http://cseweb.ucsd.edu/classes/fa09/cse130/misc/prolog/goat_etc.html
% 
% http://www.tjhsst.edu/~rlatimer/assignments2004/farmerPrologBak.html