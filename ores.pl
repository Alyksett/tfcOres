:- use_module(library(clpfd)).

max(200).

find_partial(Copper, Bismuth, Zinc) :-
    /*Var | Nugget (10 units)| Poor (15 units)| Normal (25 units)| Rich (35 units) */
    find(Copper, 4, 1, 1, Bismuth, 100, 100, 100, Zinc, 100, 100, 100).

find(Copper,
    CopperNugget,
    CopperPoor,
    CopperNormal,
    Bismuth,
    BismuthNugget,
    BismuthPoor,
    BismuthNormal,
    Zinc,
    ZincNugget,
    ZincPoor,
    ZincNormal
    ) :-
    
    max(MaxLimit),

    Copper #>= 0, Copper #=< MaxLimit,
    Bismuth #>= 0, Bismuth #=< MaxLimit,
    Zinc #>= 0, Zinc #=< MaxLimit,
    /**/
    S #= Copper + Bismuth + Zinc,
    S #=< MaxLimit,
    S mod 100 #=0,

    Copperr #= (Copper * 100) // S,
    Bismuthr #= (Bismuth * 100) // S,
    Zincr #= (Zinc * 100) // S,
    
    Copperr #>= 50, Copperr #=< 65,
    Bismuthr #>= 20, Bismuthr #=< 30,
    Zincr #>= 10, Zincr #=< 20,
    (    
        (
            (Copper mod 10 #=0, Copper // 10 #=< CopperNugget, CopperNugget - 1 #>=0);
            (Copper mod 15 #=0, Copper // 15 #=< CopperPoor, CopperPoor - 1 #>=0);
            (Copper mod 25 #=0, Copper // 25 #=< CopperNormal, CopperNormal - 1 #>=0)
            
        ),
        (
            (Bismuth mod 10 #=0, Bismuth // 10 #=< BismuthNugget, BismuthNugget - 1 #>=0);
            (Bismuth mod 15 #=0, Bismuth // 15 #=< BismuthPoor, BismuthPoor - 1 #>=0);
            (Bismuth mod 25 #=0, Bismuth // 25 #=< BismuthNormal, BismuthNormal - 1 #>=0)
        ),
        (
            (Zinc mod 10 #=0, Zinc // 10 #=< ZincNugget, ZincNugget - 1 #>=0);
            (Zinc mod 15 #=0, Zinc // 15 #=< ZincPoor, ZincPoor - 1 #>=0);
            (Zinc mod 25 #=0, Zinc // 25 #=< ZincNormal, ZincNormal - 1 #>=0)
        )
    ),
    
    % write('Copper is currently: '), write(Copper), nl,


    labeling([], [Copper, Bismuth, Zinc, CopperNugget, CopperPoor, CopperNormal, BismuthNugget, BismuthPoor, BismuthNormal,  ZincNugget, ZincPoor, ZincNormal]).
