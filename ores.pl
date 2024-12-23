:- use_module(library(clpfd)).

/*
rBottom rTop 10 15 25 30
*/
copper(50, 65, _, _, _, _).
zinc(20, 30, _, _, _, _).
bismuth(10, 20, _, _, _, _).

max(1000).

find(X, Y, Z,) :-
    max(Max),

    X #>= 0, X #=< Max,
    Y #>= 0, Y #=< Max,
    Z #>= 0, Z #=< Max,
    
    X mod 15 #=0,
    Y mod 15 #=0,
    Z mod 15 #=0,
    
    S #= X + Y + Z,
    S #=< Max,
    S mod 100 #=0,
    copper(cBottom, cTop, n, p, m, r),
    zinc(zBottom, zTop, n, p, m, r),
    bismuth(bBottom, bTop, n, p, m, r),
    
    /*
    */
    

    Xr #= (X * 100) // S,
    Yr #= (Y * 100) // S,
    Zr #= (Z * 100) // S,
    
    Xr #>= 50, Xr #=< 65,
    Yr #>= 20, Yr #=< 30,
    Zr #>= 10, Zr #=< 20,

    labeling([], [X, Y, Z]).
    
n_factorial(0, 1).
n_factorial(N, F) :-
        N #> 0,
        N1 #= N - 1,
        F #= N * F1,
        n_factorial(N1, F1).