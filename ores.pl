:- use_module(library(clpfd)).

max(1000).

find_partial(Copper, Bismuth, Zinc) :-
    /*Var | Nugget (35 units)| Poor (35 units)| Normal (35 units)| Rich (35 units) */
    find(Copper, 0, 10, 0, 0, Bismuth, 0, 10, 0, 0, Zinc, 0, 10, 0, 0).

find(Copper,
 CopperNugget,
  CopperPoor,
   CopperNormal,
    CopperRich,
     Bismuth,
      BismuthNugget,
       BismuthPoor,
        BismuthNormal,
         BismuthRich,
          Zinc,
           ZincNugget,
            ZincPoor,
             ZincNormal,
              ZincRich) :-
    max(Max),

    Copper #>= 0, Copper #=< Max,
    Bismuth #>= 0, Bismuth #=< Max,
    Zinc #>= 0, Zinc #=< Max,
    
    Copper mod 15 #=0,
    Bismuth mod 15 #=0,
    Zinc mod 15 #=0,
    
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
    