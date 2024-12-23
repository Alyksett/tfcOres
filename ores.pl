:- use_module(library(clpfd)).

max(100).


find_partial(Copper, Bismuth, Zinc) :-
    /*Var | Nugget (35 units)| Poor (35 units)| Normal (35 units)| Rich (35 units) */
    find(Copper, 5, Bismuth, 12, Zinc, 12).


find(Copper,
    CopperNugget,
    Bismuth,
    BismuthNugget,
    Zinc,
    ZincNugget) :-
    
    max(Max),
    Copper #>= 0, Copper #=< Max,
    Bismuth #>= 0, Bismuth #=< Max,
    Zinc #>= 0, Zinc #=< Max,
    
    (Copper mod 10 #=0, Copper // 10 #=< CopperNugget, CopperNugget - 1 #\=0),
    (Bismuth mod 10 #=0, Bismuth // 10 #=< BismuthNugget, BismuthNugget - 1 #\=0),
    (Zinc mod 10 #=0, Zinc // 10 #=< ZincNugget, ZincNugget - 1 #\=0),
    
    S #= Copper + Bismuth + Zinc,
    S #=< Max,
    S mod 100 #=0,

    Copperr #= (Copper * 100) // S,
    Bismuthr #= (Bismuth * 100) // S,
    Zincr #= (Zinc * 100) // S,
    
    Copperr #>= 50, Copperr #=< 65,
    Bismuthr #>= 20, Bismuthr #=< 30,
    Zincr #>= 10, Zincr #=< 20,

    labeling([], [Copper, Bismuth, Zinc]).
     

