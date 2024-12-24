:- use_module(library(clpfd)).

/*
    Constraints

    Tc = (nu_c*C_nu + po_c*C_p + noc*C_no +  pu_c*C_p)
    Tb = (nu_b*B_nu + po_b*B_p + nob*B_no +  pu_b*C_p)
    Tz = (nu_z*Z_nu + po_z*Z_p + noz*Z_no +  pu_z*C_p)

    0nuc < am_nuc, po_c < am_nuc, noc < am_noc, pu_c < am_nuc,    
    nub < am_nub, po_b < am_nub, nob < am_nob, pu_b < am_nub,    
    nuz < am_nuz, po_z < am_nuz, noz < am_noz, pu_z < am_nuz,    

    Copper:
        50-65%
    Bismuth:
        10-20%
    Zinc:
        20-30%
    
    Total % 100 = 0

*/

% 2240 is the max mb that a vessel can store
max(2240).

find_partial(Copper, Bismuth, Zinc) :-
    find(Copper, 1, 3, 0, 0, Bismuth, 10, 20, 10, 0, Zinc, 10, 20, 10, 0).

find(
    Copper,
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
    ZincRich
    ) :-
    
    CopperNuggetRange #>= 0, CopperNuggetRange #=< CopperNugget,
    CopperPoorRange #>= 0, CopperPoorRange #=< CopperPoor,
    CopperNormalRange #>= 0, CopperNormalRange #=< CopperNormal,
    CopperRichRange #>= 0, CopperRichRange #=< CopperRich,
    Copper #= (CopperNuggetRange * 10 + CopperPoorRange * 15 + CopperNormalRange * 25 + CopperRichRange * 35),
    
    BismuthNuggetRange #>= 0, BismuthNuggetRange #=< BismuthNugget, 
    BismuthPoorRange #>= 0, BismuthPoorRange #=< BismuthPoor,
    BismuthNormalRange #>= 0, BismuthNormalRange #=< BismuthNormal,
    BismuthRichRange #>= 0, BismuthRichRange #=< BismuthRich,
    Bismuth #= (BismuthNuggetRange * 10 + BismuthPoorRange * 15 + BismuthNormalRange * 25 + BismuthRichRange * 35),
    
    ZincNuggetRange #>= 0, ZincNuggetRange #=< ZincNugget,
    ZincPoorRange #>= 0, ZincPoorRange #=< ZincPoor,
    ZincNormalRange #>= 0, ZincNormalRange #=< ZincNormal,
    ZincRichRange #>= 0, ZincRichRange #=< ZincRich,
    Zinc #= (ZincNuggetRange * 10 + ZincPoorRange * 15 + ZincNormalRange * 25 + ZincRichRange * 35),
    
    
    max(MaxLimit),
    
    Copper #>= 0, Copper #=< MaxLimit,
    Bismuth #>= 0, Bismuth #=< MaxLimit,
    Zinc #>= 0, Zinc #=< MaxLimit,

    S #= Copper + Bismuth + Zinc,
    S #> 0,
    S #=< MaxLimit,
    S mod 100 #=0,
   
    Copperr #= (Copper * 100) // S,
    Bismuthr #= (Bismuth * 100) // S,
    Zincr #= (Zinc * 100) // S,
    
    Copperr #>= 50, Copperr #=< 65,
    Bismuthr #>= 10, Bismuthr #=< 20,
    Zincr #>= 20, Zincr #=< 30,

    % fudge the solver to bind vars to values? Need this
    labeling([], [Copper, Bismuth, Zinc, CopperNugget, CopperPoor, CopperNormal, BismuthNugget, BismuthPoor, BismuthNormal, ZincNugget, ZincPoor, ZincNormal, ZincNuggetRange, ZincPoorRange, ZincNormalRange, ZincRichRange]),


    write('Copper Nuggets: '), write(CopperNuggetRange), nl,
    write('Copper Poor: '), write(CopperPoorRange), nl,
    write('Copper Normal: '), write(CopperNormalRange), nl,
    write('Copper Rich: '), write(CopperRichRange), nl,
    write('Bismuth Nugget: '), write(BismuthNuggetRange), nl,
    write('Bismuth Poor: '), write(BismuthPoorRange), nl,
    write('Bismuth Normal: '), write(BismuthNormalRange), nl,
    write('Bismuth Rich: '), write(BismuthRichRange), nl,
    write('Zinc Nugget: '), write(ZincNuggetRange), nl,
    write('Zinc Poor: '), write(ZincPoorRange), nl,
    write('Zinc Normal: '), write(ZincNormalRange), nl,
    write('Zinc Rich: '), write(ZincRichRange), nl.

    


