:- use_module(library(clpfd)).

max(1000).

find(X, Y, Z,) :-
    /*constrain domain of vars*/
    max(Max),
    X #>= 0, X #=< Max,
    Y #>= 0, Y #=< Max,
    Z #>= 0, Z #=< Max,

    /*Constrain by 15mb ores*/
    X mod 15 #=0,
    Y mod 15 #=0,
    Z mod 15 #=0,

    /*Ensure that the total equals 1 ingot (100mb)*/
    S #= X + Y + Z,
    S #=< Max,
    S mod 100 #=0,
    
    /*
    Gather ratios, constrain by their unique bounds
    In this case, bismuth bronze
    */
    Xr #= (X * 100) // S,
    Yr #= (Y * 100) // S,
    Zr #= (Z * 100) // S,

    Xr #>= 50, Xr #=< 65,
    Yr #>= 20, Yr #=< 30,
    Zr #>= 10, Zr #=< 20,

    labeling([], [X, Y, Z]).
    