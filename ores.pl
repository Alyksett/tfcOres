:- use_module(library(clpfd)).

max(200).

find_partial(Copper, Bismuth, Zinc) :-
    /*Var | Nugget (10 units)| Poor (15 units)| Normal (25 units)| Rich (35 units) */
    find(Copper, 5, 0, 0, Bismuth, 100, 100, 100, Zinc, 100, 100, 100).

find(
    Copper,
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
    
    /*

        THESE ARE THE CONSTRAINTS:

        Tc = (nu_c*C_nu + po_c*C_p + noc*C_no +  pu_c*C_p)
        Tb = (nu_b*B_nu + po_b*B_p + nob*B_no +  pu_b*C_p)
        Tz = (nu_z*Z_nu + po_z*Z_p + noz*Z_no +  pu_z*C_p)

        | nuc < am_nuc, po_c < am_nuc, noc < am_noc, pu_c < am_nuc,    
        | nub < am_nub, po_b < am_nub, nob < am_nob, pu_b < am_nub,    
        | nuz < am_nuz, po_z < am_nuz, noz < am_noz, pu_z < am_nuz,    
    
        and ratios + units
    */

    Copper #= (CopperNuggetAmount * 10 + CopperPoorAmount * 15),
    CopperNuggetAmount #=< CopperNugget, CopperNuggetAmount #>= 0,
    CopperPoorAmount #=< CopperPoor, CopperPoorAmount #>= 0,
     
    Bismuth #= (BismuthNuggetAmount * 10 + BismuthPoorAmount * 15),
    BismuthNuggetAmount #=< BismuthNugget, BismuthNuggetAmount #>= 0,
    BismuthPoorAmount #=< BismuthPoor, BismuthPoorAmount #>= 0,

    Zinc #= (ZincNuggetAmount * 10 + ZincPoorAmount * 15),
    ZincNuggetAmount #=< ZincNugget, ZincNuggetAmount #>= 0,
    ZincPoorAmount #=< ZincPoor, ZincPoorAmount #>= 0, 
    

    max(MaxLimit),

    Copper #>= 0, Copper #=< MaxLimit,
    Bismuth #>= 0, Bismuth #=< MaxLimit,
    Zinc #>= 0, Zinc #=< MaxLimit,
    
   

    S #=< MaxLimit,
    S mod 100 #=0,
    S #= Copper + Bismuth + Zinc,
   
    Copperr #= (Copper * 100) // S,
    Bismuthr #= (Bismuth * 100) // S,
    Zincr #= (Zinc * 100) // S,
    
    Copperr #>= 50, Copperr #=< 65,
    Bismuthr #>= 20, Bismuthr #=< 30,
    Zincr #>= 10, Zincr #=< 20,
    
    labeling([], [Copper, Bismuth, Zinc, CopperNugget, CopperPoor, CopperNormal, BismuthNugget, BismuthPoor, BismuthNormal,  ZincNugget, ZincPoor, ZincNormal]).


